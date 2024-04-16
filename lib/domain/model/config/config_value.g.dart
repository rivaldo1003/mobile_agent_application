// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_value.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigValueAdapter extends TypeAdapter<ConfigValue> {
  @override
  final int typeId = 4;

  @override
  ConfigValue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfigValue(
      groupId: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String?,
      values: (fields[3] as List).cast<dynamic>(),
      controllerType: fields[4] as int,
      selected: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ConfigValue obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.groupId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.values)
      ..writeByte(4)
      ..write(obj.controllerType)
      ..writeByte(5)
      ..write(obj.selected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigValueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
