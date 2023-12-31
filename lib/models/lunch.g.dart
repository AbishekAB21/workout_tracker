// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lunch.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LunchAdapter extends TypeAdapter<Lunch> {
  @override
  final int typeId = 3;

  @override
  Lunch read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Lunch(
      foodName: fields[0] as String,
      protein: fields[1] as int,
      calorie: fields[2] as int,
      servings: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Lunch obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.foodName)
      ..writeByte(1)
      ..write(obj.protein)
      ..writeByte(2)
      ..write(obj.calorie)
      ..writeByte(3)
      ..write(obj.servings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LunchAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
