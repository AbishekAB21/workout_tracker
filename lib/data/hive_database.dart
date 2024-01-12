import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_tracker/datetime/date_time.dart';
import 'package:workout_tracker/models/exercise.dart';
import 'package:workout_tracker/models/workouts.dart';

class HiveDatabase {
  // refference the Hive box
  final _myBox = Hive.box("workout_database");
  final _myCutBox = Hive.box("diet_database");


  // check if data is already stored, if not, record start date
  bool previousDataExists() {
    if (_myBox.isEmpty) {
      print("Previous data does not exist");
      _myBox.put("START_DATE", todaysDate());
      return false;
    } else {
      print("Previous data exists");
      return true;
    }
  }

  // check if data is already stored (Diet)
  bool previousCutDietData() {
    if (_myCutBox.isEmpty) {
      print("Previous data does not exist");
      return false;
    } else {
      print("Previous data exists");
      return true;
    }
  }

  // return start date as yyyymmdd
  String getStatDate() {
    return _myBox.get("START_DATE");
  }

  // write data to the database (Workouts)
  void saveToDatabase(List<Workout> workouts) {
    // Convert workout objects into a List of string so that we can save it into Hive
    final workoutList = convertObjectToWorkoutList(workouts);
    final exerciseList = convertObjectToExerciseList(workouts);

    /*
    check if any exercises have been done
    put 0 or 1 based on the completion status 
    */

    if (exerciseCompleted(workouts)) {
      _myBox.put("COMPLETION_STATUS" + todaysDate(), 1);
    } else {
      _myBox.put("COMPLETION_STATUS" + todaysDate(), 0);
    }

    // Save to Hive
    _myBox.put("WORKOUTS", workoutList);
    _myBox.put("EXERCISES", exerciseList);
  }

 
  // read data, and return a list of workouts
  List<Workout> readFromDatabase() {
    List<Workout> mySavedWorkouts = [];

    List<String> workoutNames = _myBox.get("WORKOUTS");
    final exerciseDetails = _myBox.get("EXERCISES");

    // Create workout objects
    for (int i = 0; i < workoutNames.length; i++) {
      // each workout will have mltiple exercises, so we created exercise lists as per the number of workouts
      List<Exercise> exercisesInEachWorkout = [];

      for (int j = 0; j < exerciseDetails[i].length; j++) {
        // so add each exercise into a list by specifying the various properties each exercise has
        exercisesInEachWorkout.add(Exercise(
          name: exerciseDetails[i][j][0],
          weight: exerciseDetails[i][j][1],
          reps: exerciseDetails[i][j][2],
          sets: exerciseDetails[i][j][3],
          isCompleted: exerciseDetails[i][j][4] == "true" ? true : false,
        ));
      }

      // create induvidual workout
      Workout workout =
          Workout(name: workoutNames[i], exercises: exercisesInEachWorkout);

      // add induvidual workout to overall list
      mySavedWorkouts.add(workout);
    }

    return mySavedWorkouts;
  }

  // check if any exercises have been done
  bool exerciseCompleted(List<Workout> workouts) {
    // go through each workout
    for (var workout in workouts) {
      // go through each exercise in workouts
      for (var exercise in workout.exercises) {
        if (exercise.isCompleted) {
          return true;
        }
      }
    }
    return false;
  }

  // return completion status of a given date yyyymmdd
  int getCompletionStatus(String yyyymmdd) {
    // returns 0 or 1, if null then return 0
    int completionStatus = _myBox.get("COMPLETION_STATUS_$yyyymmdd") ?? 0;
    return completionStatus;
  }

  // edit Workout name and save to database
  void editWorkoutName() {}

  // 
}

// converts workout objects into a list
List<String> convertObjectToWorkoutList(List<Workout> workouts) {
  List<String> workoutList = [
    // [ Upperbody , Lowerbody ]
  ];

  for (int i = 0; i < workouts.length; i++) {
    // in each workout, add the name, followed by lists of exercises
    workoutList.add(
      workouts[i].name,
    );
  }
  return workoutList;
}

// converts exercises in workout object to a list
List<List<List<String>>> convertObjectToExerciseList(List<Workout> workouts) {
  List<List<List<String>>> exerciseList = [
    /* 
      
      [
        Upper Body
        [ [biceps, 10kg, 10reps, 3sets], [triceps, 20kg, 10reps, 3sets] ],

        Lower Body
        [ [squats, 25kg, 10reps, 3sets], [legraise, 30kg, 10reps, 3sets] ]
      ]

      */
  ];
  // go through each workout
  for (int i = 0; i < workouts.length; i++) {
    // get exercises from each workout
    List<Exercise> exercisesInWorkout = workouts[i].exercises;

    List<List<String>> induvidualWorkoout = [
      //  Upper Body
      //  [ [biceps, 10kg, 10reps, 3sets], [triceps, 20kg, 10reps, 3sets] ]
    ];

    // go through each exercise in exerciseList and add all the properties fo each exercise to the list
    for (int j = 0; j < exercisesInWorkout.length; j++) {
      List<String> induvidualExercise = [
        // [biceps, 10kg, 10reps, 3sets]
      ];

      induvidualExercise.addAll(
        [
          exercisesInWorkout[j].name,
          exercisesInWorkout[j].weight,
          exercisesInWorkout[j].reps,
          exercisesInWorkout[j].sets,
          exercisesInWorkout[j].isCompleted.toString(),
        ],
      );
      induvidualWorkoout.add(induvidualExercise);
    }

    exerciseList.add(induvidualWorkoout);
  }

  return exerciseList;
}
