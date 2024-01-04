import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_tracker/models/exercise.dart';

part 'workouts.g.dart';


@HiveType(typeId: 7)
class Workout{
   
   @HiveField(0)
   String name;

  @HiveField(1)
  final List <Exercise> exercises;

  Workout({required this.name , required this.exercises});

}