import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/screens/exercise_screen.dart';
import 'package:workout_tracker/components/heat_map.dart';
import 'package:workout_tracker/components/workout_tile.dart';
import 'package:workout_tracker/data/workout_data.dart';

class WorkoutScreen extends StatefulWidget {
 
  WorkoutScreen({super.key,});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<WorkoutData>(context, listen: false).initializeWorkoutList();
   
  }


// Form key
  final textfieldkey = GlobalKey<FormState>();

// Text Controller

  final newWorkoutNameController = TextEditingController();

// Create new workout plan

  void createNewWorkout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Create New Workout",
          style: TextStyle(color: Colors.white),
        ),
        content: Form(
          key: textfieldkey,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.deepPurpleAccent.shade200,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Enter New Workout Name",
              hintStyle: TextStyle(color: Colors.white70),
            ),
            controller: newWorkoutNameController,
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: save,
            child: Text("Save", style: TextStyle(color: Colors.white)),
          ),
          MaterialButton(
            onPressed: cancel,
            child: Text("Cancel", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

// Go to workout page
  void goToWorkoutPage(String workoutName) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExerciseScreen(
            workoutname: workoutName,
          ),
        ));
  }

// Save
  void save() {
    // Get workout name from text controller
    String newWorkOutName = newWorkoutNameController.text;
    // Add new workout to Workoutdata list
    Provider.of<WorkoutData>(context, listen: false).addWorkout(newWorkOutName);

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
    newWorkoutNameController.clear();
  }

// Edit Text controller
  final editController = TextEditingController();

// Edit
  void editAlertBox() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.deepPurple,
          //drawer: WorkoutScreenDrawer(),
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            //title: Text("General Workouts", style: TextStyle(color: Colors.white),),
            iconTheme: IconThemeData(color: Colors.white),
            centerTitle: true,
            elevation: 0,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepPurpleAccent.shade200,
            onPressed: createNewWorkout,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          body: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sports_gymnastics_rounded,
                    color: Colors.white70,
                    size: 50,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              // Heat Map
              WorkouHeatMap(
                datasets: value.heatmapset,
                startDateYYYYMMDD: value.getstardate(),
              ),

              // Workouts
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: value.getWorkoutList().length,
                  // Calls the WorkoutTile page and passes the workout name as parameter
                  itemBuilder: (context, index) => WorkoutTile(
                        workoutName: value.getWorkoutList()[index].name,
                        delete: IconButton(
                            onPressed: () {
                              String workoutName =
                                  value.getWorkoutList()[index].name;
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.deepPurple,
                                    content: Text(
                                      "Are you sure you want to delete $workoutName ?",
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                    actions: [
                                      // Yes
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              value.deleteFromDatabase(index);
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Yes",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),

                                      //Cancel
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            "Cancel",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.delete)),
                        edit: IconButton(
                            //bottomsheet or Alert dialogue
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.deepPurple,
                                    title: Text("Edit Workout Name",
                                        style: TextStyle(color: Colors.white)),
                                    content: TextField(
                                      controller: editController,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        fillColor:
                                            Colors.deepPurpleAccent.shade200,
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.deepPurple)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white70)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        hintText: "Enter Updated Workout Name",
                                        hintStyle: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            // edit operation should be saved/updated so call the function here in set state
                                            setState(() {
                                              value.editWorkoutName(
                                                  editController.text, index);
                                              editController.clear();
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Update",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancel",
                                              style: TextStyle(
                                                  color: Colors.white)))
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.edit)),
                      )),
            ],
          )),
    );
  }
}
