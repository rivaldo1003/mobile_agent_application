import 'package:dartz/dartz.dart';
import 'package:elderselettricomobile/data/source/local/vehicle_local_datasource.dart';
import 'package:elderselettricomobile/domain/repository/vehicle_repository.dart';
import 'package:elderselettricomobile/core/utils/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/model/vehicle.dart';
import '../../flavors.dart';
import '../../core/values/constants.dart';
import '../source/remote/vehicle_remote_datasource.dart';

class VehicleRepositoryImpl extends VehicleRepository {
  final VehicleLocalDataSource localDataSource;
  final VehicleRemoteDataSource remoteDataSource;

  VehicleRepositoryImpl(this.localDataSource, this.remoteDataSource);

  @override
  Future<Vehicle?> getVehicleByDeviceId(String deviceId) {
    return localDataSource.getVehicleByDeviceId(deviceId);
  }

  @override
  Future<Either<Exception, Vehicle>> saveVehicle(
    String serverDeviceId,
    String deviceId,
    String vehicleName,
    String registrationNumber,
    String model,
    String year,
    String color,
    String purchaseDate,
    String? photoPath,
    String? photoUrl,
    String? physicalNumber,
    String? vehicleId,
    String? creatorUserId,
    String? base64Image,
  ) async {
    final vehicle = Vehicle(
      deviceId: deviceId,
      vehicleName: vehicleName,
      registrationNumber: registrationNumber,
      model: model,
      year: year,
      color: color,
      purchaseDate: purchaseDate,
      photoPath: photoPath ?? '',
      photoUrl: photoUrl,
      physicalNumber: physicalNumber,
      vehicleId: vehicleId,
      creatorUserId: creatorUserId,
      serverDeviceId: serverDeviceId,
    );

    if (base64Image != null && FlavorConfig.appFlavor == Flavor.PROD) {
      final result = await remoteDataSource.saveVehicle(
        serverDeviceId,
        vehicle,
        base64Image,
      );

      return result.fold((e) {
        return Left(e);
      }, (data) async {
        vehicle.physicalNumber = data.physicalNumber;
        vehicle.photoUrl = data.primaryPicture?.url;
        vehicle.vehicleId = data.id;
        vehicle.creatorUserId = data.creatorUser?.id;
        await localDataSource.saveVehicle(
          deviceId,
          vehicle,
        );
        return Right(vehicle);
      });
    } else {
      await localDataSource.saveVehicle(
        deviceId,
        vehicle,
      );

      return Right(vehicle);
    }
  }

  @override
  Future<Either<Exception, Vehicle>> updateVehicle(
    String serverDeviceId,
    String deviceId,
    String vehicleId,
    String vehicleName,
    String registrationNumber,
    String model,
    String year,
    String color,
    String purchaseDate,
    String? photoPath,
    String? photoUrl,
    String? physicalNumber,
    String? creatorUserId,
    String? base64Image,
  ) async {
    final vehicle = Vehicle(
      deviceId: deviceId,
      vehicleName: vehicleName,
      registrationNumber: registrationNumber,
      model: model,
      year: year,
      color: color,
      purchaseDate: purchaseDate,
      photoPath: photoPath ?? '',
      photoUrl: photoUrl,
      physicalNumber: physicalNumber,
      vehicleId: vehicleId,
      creatorUserId: creatorUserId,
      serverDeviceId: serverDeviceId,
    );

    if (FlavorConfig.appFlavor == Flavor.PROD) {
      final result = await remoteDataSource.updateVehicle(
        serverDeviceId,
        vehicle,
        base64Image,
      );

      return result.fold((e) {
        return Left(e);
      }, (data) async {
        vehicle.photoUrl = data.primaryPicture?.url;
        await localDataSource.saveVehicle(
          deviceId,
          vehicle,
        );

        return Right(vehicle);
      });
    } else {
      await localDataSource.saveVehicle(
        deviceId,
        vehicle,
      );

      return Right(vehicle);
    }
  }

  @override
  Future<List<Vehicle>> getAllVehicle() async {
    final result = await remoteDataSource.getAllVehicle();
    final vehicleList = result.getRight();
    if (vehicleList != null) {
      await localDataSource.saveAllVehicle(vehicleList);
    }
    return localDataSource.getAllVehicle();
  }

  @override
  Future<void> deleteVehicleByIds(List<String> deviceIds) async {
    await localDataSource.deleteVehicleByIds(deviceIds);
    final pref = await SharedPreferences.getInstance();
    final lastConnectedDevice = pref.getString(KEY_LAST_CONNECTED_DEVICE);
    if (deviceIds.contains(lastConnectedDevice)) {
      await pref.remove(KEY_LAST_CONNECTED_DEVICE);
    }
  }
}
