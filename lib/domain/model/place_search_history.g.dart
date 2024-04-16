// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_search_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlaceSearchHistoryAdapter extends TypeAdapter<PlaceSearchHistory> {
  @override
  final int typeId = 3;

  @override
  PlaceSearchHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaceSearchHistory(
      id: fields[0] as String,
      mainText: fields[1] as String,
      secondaryText: fields[2] as String?,
      createdTime: fields[3] as int,
      distance: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PlaceSearchHistory obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.mainText)
      ..writeByte(2)
      ..write(obj.secondaryText)
      ..writeByte(3)
      ..write(obj.createdTime)
      ..writeByte(4)
      ..write(obj.distance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaceSearchHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
