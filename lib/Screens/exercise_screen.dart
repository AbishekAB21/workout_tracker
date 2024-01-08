import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/components/exercise_tile.dart';
import 'package:workout_tracker/data/workout_data.dart';
import 'package:workout_tracker/models/exercise.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class ExerciseScreen extends StatefulWidget {
  final String workoutname;

  const ExerciseScreen({super.key, required this.workoutname});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
// Checkbox fucntion

  void onCheckBoxChanged(String workoutName, String exerciseName) {
    Provider.of<WorkoutData>(context, listen: false)
        .checkOffExercise(workoutName, exerciseName);
  }

  // Text Controllers
  final exerciseNameController = TextEditingController();
  final weightController = TextEditingController();
  final repsController = TextEditingController();
  final setsController = TextEditingController();

// Create new exercise function

  void createNewExercise() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: apptheme.primaryColor,
        title:
            Text("Add a new exercise", style: apptheme.titleText),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Exercise Name
            TextField(
              style: apptheme.inputText,
              controller: exerciseNameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: apptheme.primaryColor,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: apptheme.borderColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: apptheme.borderColor)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Enter New Exercise Name",
                hintStyle: apptheme.hintText,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Weight
            TextField(
              style: apptheme.inputText,
              decoration: InputDecoration(
                filled: true,
                fillColor: apptheme.primaryColor,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: apptheme.borderColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: apptheme.borderColor)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Weight used",
                hintStyle: apptheme.hintText,
              ),
              controller: weightController,
            ),
            SizedBox(
              height: 10,
            ),
            // Reps
            TextField(
              style: apptheme.inputText,
              decoration: InputDecoration(
                filled: true,
                fillColor: apptheme.primaryColor,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: apptheme.borderColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: apptheme.borderColor)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Reps done",
                hintStyle: apptheme.hintText,
              ),
              controller: repsController,
            ),
            SizedBox(
              height: 10,
            ),
            // Sets
            TextField(
              style: apptheme.inputText,
              decoration: InputDecoration(
                filled: true,
                fillColor: apptheme.primaryColor,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: apptheme.borderColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: apptheme.borderColor)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Sets done",
                hintStyle: apptheme.hintText,
              ),
              controller: setsController,
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: save,
            child: Text(
              "Save",
              style: apptheme.buttonTextColor,
            ),
          ),
          MaterialButton(
            onPressed: cancel,
            child: Text(
              "Cancel",
              style: apptheme.buttonTextColor,
            ),
          )
        ],
      ),
    );
  }

  // Save
  void save() {
    // Get new Exercise name from text controller
    String newExerciseName = exerciseNameController.text;
    String weight = weightController.text;
    String reps = repsController.text;
    String sets = setsController.text;
    // Add new Exercise to Workoutdata list
    Provider.of<WorkoutData>(context, listen: false)
        .addExercise(widget.workoutname, newExerciseName, weight, reps, sets);
    Navigator.pop(context);
    clear();
  }

// Cancel
  void cancel() {
    Navigator.pop(context);
    clear();
  }

// Clear
  void clear() {
    exerciseNameController.clear();
    weightController.clear();
    repsController.clear();
    setsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: apptheme.primaryColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: apptheme.foregroundColor),
          backgroundColor: apptheme.primaryColor,
          title: Text(
            widget.workoutname,
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: apptheme.secondaryColor,
          onPressed: createNewExercise,
          child:  Icon(
            Icons.add,
            color: apptheme.primaryColor,
          ),
        ),
        body: ListView.builder(
            itemCount: value.numberofExercisesInWorkout(widget.workoutname),
            itemBuilder: (context, index) => ExerciseTile(
              exerciseName: value
                  .getRelevantWorkout(widget.workoutname)
                  .exercises[index]
                  .name,
              weight: value
                  .getRelevantWorkout(widget.workoutname)
                  .exercises[index]
                  .weight,
              reps: value
                  .getRelevantWorkout(widget.workoutname)
                  .exercises[index]
                  .reps,
              sets: value
                  .getRelevantWorkout(widget.workoutname)
                  .exercises[index]
                  .sets,
              isCompleted: value
                  .getRelevantWorkout(widget.workoutname)
                  .exercises[index]
                  .isCompleted,
              onCheckBoxChanged: (val) => onCheckBoxChanged(
                  widget.workoutname,
                  value
                      .getRelevantWorkout(widget.workoutname)
                      .exercises[index]
                      .name),
            )),
      ),
    );
  }
}
