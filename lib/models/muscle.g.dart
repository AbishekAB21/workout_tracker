// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscle.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MuscleAdapter extends TypeAdapter<Muscle> {
  @override
  final int typeId = 5;

  @override
  Muscle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Muscle(
      muscleName: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Muscle obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.muscleName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MuscleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
