// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehicleAdapter extends TypeAdapter<Vehicle> {
  @override
  final int typeId = 0;

  @override
  Vehicle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Vehicle(
      deviceId: fields[0] as String,
      vehicleName: fields[1] as String,
      registrationNumber: fields[2] as String,
      model: fields[3] as String,
      year: fields[4] as String,
      color: fields[5] as String,
      purchaseDate: fields[6] as String,
      photoPath: fields[7] as String,
      photoUrl: fields[8] as String?,
      vehicleId: fields[9] as String?,
      physicalNumber: fields[10] as String?,
      creatorUserId: fields[11] as String?,
      serverDeviceId: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Vehicle obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.deviceId)
      ..writeByte(1)
      ..write(obj.vehicleName)
      ..writeByte(2)
      ..write(obj.registrationNumber)
      ..writeByte(3)
      ..write(obj.model)
      ..writeByte(4)
      ..write(obj.year)
      ..writeByte(5)
      ..write(obj.color)
      ..writeByte(6)
      ..write(obj.purchaseDate)
      ..writeByte(7)
      ..write(obj.photoPath)
      ..writeByte(8)
      ..write(obj.photoUrl)
      ..writeByte(9)
      ..write(obj.vehicleId)
      ..writeByte(10)
      ..write(obj.physicalNumber)
      ..writeByte(11)
      ..write(obj.creatorUserId)
      ..writeByte(12)
      ..write(obj.serverDeviceId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
