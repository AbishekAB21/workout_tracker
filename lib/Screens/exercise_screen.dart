import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/components/exercise_tile.dart';
import 'package:workout_tracker/data/workout_data.dart';
import 'package:workout_tracker/models/exercise.dart';

class ExerciseScreen extends StatefulWidget {

  final String workoutname;

  const ExerciseScreen({super.key, required this.workoutname});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {

// Checkbox fucntion

 void onCheckBoxChanged(String workoutName , String exerciseName)
 {
   Provider.of<WorkoutData>(context, listen: false)
   .checkOffExercise(workoutName, exerciseName);
 }

 // Text Controllers
  final exerciseNameController = TextEditingController();
  final weightController = TextEditingController();
  final repsController = TextEditingController();
  final setsController = TextEditingController();

// Create new exercise function

  void createNewExercise()
  {
    showDialog(
      context: context, 
      builder: (context)=> AlertDialog(
        backgroundColor: Colors.black,
        title: Text(
          "Add a new exercise",
          style: TextStyle(color: Colors.white)
          ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Exercise Name
            TextField(
              style: TextStyle(color: Colors.white),
              controller: exerciseNameController,
              decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Enter New Exercise Name",
              hintStyle: TextStyle(color: Colors.grey[400]),
            ),
            ),
            SizedBox(height: 10,),
            // Weight
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Weight used",
              hintStyle: TextStyle(color: Colors.grey[400]),
            ),
              controller: weightController,  
            ),
            SizedBox(height: 10,),
            // Reps
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Reps done",
              hintStyle: TextStyle(color: Colors.grey[400]),
            ),
              controller: repsController,
            ),
            SizedBox(height: 10,),
            // Sets
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Sets done",
              hintStyle: TextStyle(color: Colors.grey[400]),
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
              style: TextStyle(color: Colors.white),
              ),
            ),

           MaterialButton(
            onPressed: cancel,
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.white),
              ),
            )
        ],
      ),
    
    );
  }

  // Save 
void save(){

  // Get new Exercise name from text controller
  String newExerciseName = exerciseNameController.text;
  String weight = weightController.text;
  String reps = repsController.text;
  String sets = setsController.text;
  // Add new Exercise to Workoutdata list
  Provider.of<WorkoutData>(context, listen: false).addExercise(
    widget.workoutname, 
    newExerciseName, 
    weight, 
    reps, 
    sets
    );
  Navigator.pop(context);
  clear();
  
}

// Cancel
void cancel(){
  Navigator.pop(context);
  clear();
}

// Clear
void clear(){
  exerciseNameController.clear();
  weightController.clear();
  repsController.clear();
  setsController.clear();
}

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(builder: (context, value, child) => Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.workoutname),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: createNewExercise , 
        child: const Icon(Icons.add),
        ),

      body: ListView.builder(
        itemCount: value.numberofExercisesInWorkout(widget.workoutname),
        itemBuilder: (context, index) => Dismissible(
          background: Container(
              margin: EdgeInsets.only(top: 20),
              color: Colors.red.shade800,
              child: Icon(Icons.delete),
            ),
            key: ValueKey<Exercise>(value.getRelevantWorkout(widget.workoutname).exercises[index]),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              
              // Delete from Database
            },
          child: ExerciseTile(
            exerciseName: value.getRelevantWorkout(widget.workoutname).exercises[index].name, 
            weight: value.getRelevantWorkout(widget.workoutname).exercises[index].weight, 
            reps: value.getRelevantWorkout(widget.workoutname).exercises[index].reps, 
            sets: value.getRelevantWorkout(widget.workoutname).exercises[index].sets, 
            isCompleted: value.getRelevantWorkout(widget.workoutname).exercises[index].isCompleted,
            onCheckBoxChanged: (val) => onCheckBoxChanged(
              widget.workoutname,
              value.getRelevantWorkout(widget.workoutname).exercises[index].name
            ),
            ),
        )
        ),
    ),);
  }
}