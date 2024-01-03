
import 'package:hive_flutter/hive_flutter.dart';

part 'exercise_model.g.dart';

@HiveType(typeId: 6)
class Exercises {

  @HiveField(0)
  late String exerciseName;
  @HiveField(1)
  late double weightsUsed;
  @HiveField(2)
  late int repsDone;
  @HiveField(3)
  late int setsCompleted;

  Exercises(
      {required this.exerciseName,
      required this.weightsUsed,
      required this.repsDone,
      required this.setsCompleted});
}
