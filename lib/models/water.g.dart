// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WaterAdapter extends TypeAdapter<Water> {
  @override
  final int typeId = 9;

  @override
  Water read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Water(
      waterPercent: fields[0] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Water obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.waterPercent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WaterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
