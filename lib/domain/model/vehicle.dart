import 'package:hive/hive.dart';

part 'vehicle.g.dart';

@HiveType(typeId: 0)
class Vehicle {
  @HiveField(0)
  String deviceId;

  @HiveField(1)
  String vehicleName;

  @HiveField(2)
  String registrationNumber;

  @HiveField(3)
  String model;

  @HiveField(4)
  String year;

  @HiveField(5)
  String color;

  @HiveField(6)
  String purchaseDate;

  @HiveField(7)
  String photoPath;

  @HiveField(8)
  String? photoUrl;

  @HiveField(9)
  String? vehicleId;

  @HiveField(10)
  String? physicalNumber;

  @HiveField(11)
  String? creatorUserId;

  @HiveField(12)
  String? serverDeviceId;

  Vehicle({
    required this.deviceId,
    required this.vehicleName,
    required this.registrationNumber,
    required this.model,
    required this.year,
    required this.color,
    required this.purchaseDate,
    required this.photoPath,
    this.photoUrl,
    this.vehicleId,
    this.physicalNumber,
    this.creatorUserId,
    this.serverDeviceId,
  });
}
