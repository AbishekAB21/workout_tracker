import 'package:workout_tracker/models/exercise_model.dart';

class WorkoutModel {
  final String workoutName;
  final List<ExerciseModel> exerciseDetails;

  WorkoutModel({required this.workoutName, required this.exerciseDetails});
}
