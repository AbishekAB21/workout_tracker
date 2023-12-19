import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/Screens/bmi_calculator.dart';
import 'package:workout_tracker/Screens/diet_page.dart';
import 'package:workout_tracker/Screens/workout_history.dart';
import 'package:workout_tracker/Screens/exercise_screen.dart';
import 'package:workout_tracker/Screens/workout_planner.dart';
import 'package:workout_tracker/components/heat_map.dart';
import 'package:workout_tracker/components/workout_tile.dart';
import 'package:workout_tracker/data/workout_data.dart';
import 'package:workout_tracker/models/workouts.dart';

class WorkoutScreen extends StatefulWidget {
  // bool isAdmin;
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
        backgroundColor: Colors.black,
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
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Enter New Workout Name",
              hintStyle: TextStyle(color: Colors.white),
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
          backgroundColor: Colors.grey[300],
          //drawer: WorkoutScreenDrawer(),
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("General Workouts"),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: createNewWorkout,
            child: Icon(Icons.add),
          ),
          body: ListView(
            children: [
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
                        isvisible: false,
                        delete: IconButton(
                            onPressed: () {
                              String workoutName =
                                  value.getWorkoutList()[index].name;
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.black,
                                    content: Text(
                                      "Are you sure you want to delete $workoutName ?",
                                      style: TextStyle(color: Colors.white),
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
                                    backgroundColor: Colors.black,
                                    title: Text("Edit Workout Name",
                                        style: TextStyle(color: Colors.white)),
                                    content: TextField(
                                      controller: editController,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey)),
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

class WorkoutScreenDrawer extends StatelessWidget {
  const WorkoutScreenDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[700],
      child: Container(
        margin: EdgeInsets.only(top: 60, bottom: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutHistoryPage(),
                    ));
              },
              child: Row(
                children: [Icon(Icons.history), Text(" Workout History")],
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutPlanner(),
                    ));
              },
              child: Row(
                children: [
                  Icon(Icons.list_alt_sharp),
                  Text(" Personal Workout Plan")
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMICalculator(),
                    ));
              },
              child: Row(
                children: [Icon(Icons.fastfood_rounded), Text(" Diet plan")],
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMICalculator(),
                    ));
              },
              child: Row(
                children: [Icon(Icons.calculate), Text(" BMI Calculator")],
              ),
            )
          ],
        ),
      ),
    );
  }
}
