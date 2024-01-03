// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExercisesAdapter extends TypeAdapter<Exercises> {
  @override
  final int typeId = 6;

  @override
  Exercises read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Exercises(
      exerciseName: fields[0] as String,
      weightsUsed: fields[1] as double,
      repsDone: fields[2] as int,
      setsCompleted: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Exercises obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.exerciseName)
      ..writeByte(1)
      ..write(obj.weightsUsed)
      ..writeByte(2)
      ..write(obj.repsDone)
      ..writeByte(3)
      ..write(obj.setsCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExercisesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
