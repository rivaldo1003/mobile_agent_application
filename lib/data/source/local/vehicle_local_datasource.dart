import 'package:elderselettricomobile/domain/mapper/vehicle_mapper.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/model/vehicle.dart';
import '../../../domain/model/mcu_connect.dart' as remote;
import '../../../core/values/constants.dart';
import '../../../core/utils/hive_util.dart';

class VehicleLocalDataSource {
  Future<Vehicle?> getVehicleByDeviceId(String deviceId) {
    final vehicleBox = HiveHelper.vehicleBox();
    final vehicle = vehicleBox.get(deviceId);
    return vehicle;
  }

  Future<Vehicle> saveVehicle(
    String deviceId,
    Vehicle vehicle,
  ) async {
    final vehicleBox = HiveHelper.vehicleBox();
    await vehicleBox.put(deviceId, vehicle);
    return vehicle;
  }

  Future<List<Vehicle>> getAllVehicle() async {
    final vehicleBox = HiveHelper.vehicleBox();
    final vehicleIds = vehicleBox.keys.toList().reversed;
    List<Vehicle> vehicles = [];
    await Future.wait(vehicleIds.map((id) async {
      final vehicle = await vehicleBox.get(id);
      if (vehicle != null) {
        vehicles.add(vehicle);
      }
    }));
    return vehicles;
  }

  Future<void> saveAllVehicle(List<remote.Vehicle> vehicleList) async {
    final vehicleBox = HiveHelper.vehicleBox();
    final vehicleIds = vehicleBox.keys.toList();
    final pref = await SharedPreferences.getInstance();
    final lastConnectedDevice = pref.getString(KEY_LAST_CONNECTED_DEVICE);

    await Future.wait(vehicleIds.map((id) async {
      final localVehicle = await vehicleBox.get(id);
      if (localVehicle == null) return;
      if (localVehicle.vehicleId == null) {
        if (localVehicle.deviceId == lastConnectedDevice) {
          await pref.remove(KEY_LAST_CONNECTED_DEVICE);
        }
        await vehicleBox.delete(id);
      } else {
        final remoteVehicle =
            vehicleList.firstWhereOrNull((e) => e.id == localVehicle.vehicleId);
        if (remoteVehicle == null) return;
        final vehicle = remoteVehicle.toLocalVehicle(
          localVehicle.deviceId,
          localVehicle.serverDeviceId,
        );
        await vehicleBox.put(localVehicle.deviceId, vehicle);
      }
    }));
  }

  Future<void> deleteVehicleByIds(List<String> deviceIds) async {
    final vehicleBox = HiveHelper.vehicleBox();
    await vehicleBox.deleteAll(deviceIds);
  }
}
