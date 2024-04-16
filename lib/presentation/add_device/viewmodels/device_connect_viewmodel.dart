import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:elderselettricomobile/core/custom_exception.dart';
import 'package:elderselettricomobile/domain/model/mcu_connect.dart';
import 'package:elderselettricomobile/domain/model/result.dart';
import 'package:elderselettricomobile/domain/repository/device_repository.dart';
import 'package:get/get.dart';

import '../../../core/base/base_view_model.dart';
import '../../../domain/model/vehicle.dart' as local;
import '../../../domain/repository/vehicle_repository.dart';
import '../../../flavors.dart';

class DeviceConnectViewModel extends BaseViewModel {
  final deviceRepository = Get.find<DeviceRepository>();
  final vehicleRepository = Get.find<VehicleRepository>();

  ResultState<McuConnect> state = ResultState.init();

  final _androidIdPlugin = AndroidId();

  Future<ResultState<McuConnect>> connectMCU(
    String deviceId,
    String deviceName,
  ) async {
    _setState(ResultState.loading());
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none ||
        FlavorConfig.appFlavor == Flavor.DEV) {
      final localVehicle = await getVehicleByDeviceId(deviceId);
      if (localVehicle != null || FlavorConfig.appFlavor == Flavor.DEV) {
        _setState(ResultState.success(
          McuConnect(deviceId: deviceId, vehicle: localVehicle),
        ));
        return state;
      } else {
        _setState(ResultState.error(NoInternetException()));
        return state;
      }
    }

    String? clientId = null;
    if (Platform.isAndroid) {
      clientId = await _androidIdPlugin.getId();
    }

    final result =
        await deviceRepository.connectMCU(deviceId, deviceName, clientId);

    return result.fold((e) {
      _setState(ResultState.error(e));
      return state;
    }, (data) async {
      local.Vehicle? localVehicle;
      if (data.vehicle != null) {
        final vehicle = data.vehicle!;

        localVehicle = await getVehicleByDeviceId(deviceId);
        final vehicleResult = await vehicleRepository.saveVehicle(
          data.deviceId,
          deviceId,
          vehicle.name,
          vehicle.registrationNumber ?? '',
          vehicle.model ?? '',
          '${vehicle.year ?? ''}',
          vehicle.color ?? '',
          vehicle.purchaseDate ?? '',
          localVehicle?.photoPath ?? '',
          vehicle.primaryPicture?.url,
          vehicle.physicalNumber,
          vehicle.id,
          vehicle.creatorUser?.id,
          null,
        );

        vehicleResult.fold((l) {}, (data) {
          localVehicle = data;
        });
      }

      _setState(ResultState.success(
        McuConnect(deviceId: data.deviceId, vehicle: localVehicle),
      ));
      return state;
    });
  }

  void _setState(ResultState<McuConnect> state) {
    this.state = state;
    notifyListeners();
  }

  Future<local.Vehicle?> getVehicleByDeviceId(String deviceId) {
    return vehicleRepository.getVehicleByDeviceId(deviceId);
  }
}
