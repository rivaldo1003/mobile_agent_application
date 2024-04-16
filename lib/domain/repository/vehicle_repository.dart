import 'package:dartz/dartz.dart';

import '../../domain/model/vehicle.dart';

abstract class VehicleRepository {
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
    String? base64image,
  );

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
    String? base64image,
  );

  Future<Vehicle?> getVehicleByDeviceId(String deviceId);

  Future<List<Vehicle>> getAllVehicle();

  Future<void> deleteVehicleByIds(List<String> deviceIds);
}
