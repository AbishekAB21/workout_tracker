import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/screens/exercise_screen.dart';
import 'package:workout_tracker/components/heat_map.dart';
import 'package:workout_tracker/components/workout_tile.dart';
import 'package:workout_tracker/data/workout_data.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class WorkoutScreen extends StatefulWidget {
  WorkoutScreen({
    super.key,
  });

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
        backgroundColor: apptheme.primaryColor,
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
              hintText: "Enter New Workout Name",
              hintStyle: apptheme.hintText,
            ),
            controller: newWorkoutNameController,
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: save,
            child: Text("Save", style: apptheme.buttonTextColor),
          ),
          MaterialButton(
            onPressed: cancel,
            child: Text("Cancel", style: apptheme.buttonTextColor),
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
          backgroundColor: apptheme.primaryColor,
          //drawer: WorkoutScreenDrawer(),
          appBar: AppBar(
            backgroundColor: apptheme.primaryColor,
            //title: Text("General Workouts", style: TextStyle(color: Colors.white),),
            iconTheme: IconThemeData(color: Colors.white),
            centerTitle: true,
            elevation: 0,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: apptheme.secondaryColor,
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
                  // Icon(
                  //   Icons.sports_gymnastics_rounded,
                  //   color: Colors.white70,
                  //   size: 50,
                  // )
                  Container(
                      height: 60,
                      width: 60,
                      child: Image.asset("assets/weightlifting.png")),
                ],
              ),
              SizedBox(
                height: 6,
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
                                    backgroundColor: apptheme.primaryColor,
                                    content: Text(
                                      "Are you sure you want to delete $workoutName ?",
                                      style: apptheme.titleText,
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
                                                apptheme.buttonTextColor,
                                          )),

                                      //Cancel
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            "Cancel",
                                            style:
                                                apptheme.buttonTextColor,
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
                                    backgroundColor: apptheme.primaryColor,
                                    title: Text("Edit Workout Name",
                                        style: apptheme.titleText),
                                    content: TextField(
                                      controller: editController,
                                      style: apptheme.labelText,
                                      decoration: InputDecoration(
                                        fillColor:
                                            apptheme.primaryColor,
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: apptheme.borderColor)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: apptheme.borderColor)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        hintText: "Enter Updated Workout Name",
                                        hintStyle: apptheme.hintText
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
                                                apptheme.buttonTextColor,
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancel",
                                              style: apptheme.buttonTextColor))
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
