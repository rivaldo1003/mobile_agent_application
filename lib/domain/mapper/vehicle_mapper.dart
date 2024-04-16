import '../model/mcu_connect.dart' as remote;
import '../model/vehicle.dart' as local;

extension VehicleMapper on remote.Vehicle {
  local.Vehicle toLocalVehicle(String deviceId, String? serverDeviceId) {
    return local.Vehicle(
      deviceId: deviceId,
      vehicleName: name,
      registrationNumber: registrationNumber ?? '',
      model: model ?? '',
      year: '$year',
      color: color ?? '',
      purchaseDate: purchaseDate ?? '',
      photoPath: '',
      photoUrl: primaryPicture?.url,
      vehicleId: id,
      physicalNumber: physicalNumber,
      creatorUserId: creatorUser?.id,
      serverDeviceId: serverDeviceId,
    );
  }
}
