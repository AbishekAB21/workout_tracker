import 'package:flutter/material.dart';
import 'package:workout_tracker/data/hive_database.dart';
import 'package:workout_tracker/datetime/date_time.dart';
import 'package:workout_tracker/models/exercise.dart';
import 'package:workout_tracker/models/workouts.dart';


class WorkoutData extends ChangeNotifier {
  final db = HiveDatabase();

  /* 
  
  WORKOUT DATA STRUCTURE

    - An Overall list contains the differnet workouts
    - Inside each Workout list there will be a name and list of exercises

  */

  // Here we call the Workout class inside the list
  List<Workout> workoutList = [
    Workout(name: "Upper Body", exercises: [
      // Here we can add lists of Exercises for a specific Workout Plan
      Exercise(name: "Biceps", weight: "7.5", reps: "15", sets: "3"),
    ]),
    Workout(name: "Lower Body", exercises: [
      // Here we can add lists of Exercises for a specific Workout Plan
      Exercise(name: "Calves", weight: "20", reps: "15", sets: "3"),
    ])
  ];

  // if there are workouts already in the database, then get that workout list.

  void initializeWorkoutList() {
    if (db.previousDataExists()) // if previousDataExists() returns true
    {
      workoutList = db.readFromDatabase();
    }
    //Otherwise display the default wrokouts or pre programmed ones
    else {
      // if previousDataExists() returns false
      db.saveToDatabase(workoutList);
    }

    // load heat map
    loadHeatMap();
  }

  // Get length of exercises a given workout
  int numberofExercisesInWorkout(String workoutName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    return relevantWorkout.exercises.length;
  }

  // Get the list of workouts
  List<Workout> getWorkoutList() {
    return workoutList;
  }

  // Add a workout
  void addWorkout(String name) {
    // Add a new workout plan with an empty list of exercises that can be added later
    workoutList.add(Workout(name: name, exercises: []));

    notifyListeners();

    //save to database
    db.saveToDatabase(workoutList);
  }

  // Add an exercise(s) to a workout
  void addExercise(String workoutName, String exerciseName, String weight,
      String reps, String sets) {
    // We have to find the relevant workout
    // Here we are looking for the first time when the workoutName is similar to Workout.name

    Workout relevantWorkout = getRelevantWorkout(workoutName);

    // Once we find the relevant workout plan we can add the exercises to it

    relevantWorkout.exercises.add(
        Exercise(name: exerciseName, weight: weight, reps: reps, sets: sets));

    notifyListeners();

    //save to database
    db.saveToDatabase(workoutList);
  }

  // Check off an excersice once done

  // Same as the previous one here too we have to find the relevant workout an Exercise
  void checkOffExercise(String workoutName, String exerciseName) {
    // Finding the relevant exercise
    Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);

    // Check off boolean to show that the user completed the exercise
    relevantExercise.isCompleted = !relevantExercise.isCompleted;
    print("tapped");

    notifyListeners();
    //save to database
    db.saveToDatabase(workoutList);

    // load heat map
    loadHeatMap();
  }

  // Get relevant Workout , given a workout name
  Workout getRelevantWorkout(String workoutName) {
    Workout relevantWorkout =
        workoutList.firstWhere((workout) => workout.name == workoutName);

    return relevantWorkout;
  }

  // Get relevant Exercise , given Workout name + Exercise name

  Exercise getRelevantExercise(String workoutName, String exerciseName) {
    // Finding relevant workout first
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    // Finding relevant Exercise
    Exercise relevantExercise = relevantWorkout.exercises
        .firstWhere((exercise) => exercise.name == exerciseName);
    return relevantExercise;
  }

  // delete from database
  void deleteFromDatabase(int index) {
    workoutList.removeAt(index);

    notifyListeners();
    db.saveToDatabase(workoutList);
  }

  // Edit Workout name
  void editWorkoutName(String newWorkoutName, int index) {
    workoutList[index].name = newWorkoutName;

    notifyListeners();
    db.saveToDatabase(workoutList);
  }

  // Get start date
  String getstardate() {
    return db.getStatDate();
  }

  /*
  
  HEAT MAP

  */

  Map<DateTime, int> heatmapset = {};

  // Loading the heat map
  void loadHeatMap() {
    DateTime startDate = createDatetimeObject(getstardate());

    // Number of days to laod
    int daysInbetween = DateTime.now().difference(startDate).inDays;

    // go from startdate to today and add each completion status to datasets
    // "COMPLEION_STATUS_yyyymmdd" will be the key in this database
    for (int i = 0; i < daysInbetween + 1; i++) {
      String yyyymmdd =
          convertDateTimeToYYYYMMDD(startDate.add(Duration(days: i)));

      // Completion status = 0 or 1
      int completionstatus = db.getCompletionStatus(yyyymmdd);

      // Year
      int year = startDate.add(Duration(days: i)).year;

      // Month
      int month = startDate.add(Duration(days: i)).month;

      // Day
      int day = startDate.add(Duration(days: i)).day;

      final percentForEachDay = <DateTime, int>{
        DateTime(year, month, day): completionstatus
      };

      // Add to heatmap datasets
      heatmapset.addEntries(percentForEachDay.entries);
    }
  }

  
}
