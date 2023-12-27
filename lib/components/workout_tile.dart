import 'package:flutter/material.dart';
import 'package:workout_tracker/Screens/exercise_screen.dart';

class WorkoutTile extends StatelessWidget {
  String workoutName;
  bool? isvisible;
  IconButton delete;
  IconButton edit;
  WorkoutTile({
    super.key,
    required this.workoutName,
    required this.isvisible,
    required this.delete,
    required this.edit,
  });

  // Go to workout page
  void goToWorkoutPage(String workoutName, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExerciseScreen(
            workoutname: workoutName,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: ListTile(
        tileColor: Colors.deepPurpleAccent.shade200,
        textColor: Colors.white,
        iconColor: Colors.white,
        contentPadding: EdgeInsets.all(15),
        onTap: () => goToWorkoutPage(workoutName, context),
        title: Text(
          workoutName,
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(visible: !isvisible!, child: delete),
            Visibility(visible: !isvisible!, child: edit),
            IconButton(
                onPressed: () => goToWorkoutPage(workoutName, context),
                icon: Icon(Icons.arrow_forward_ios)),
          ],
        ),
        leading: Icon(Icons.sports_gymnastics_rounded, color: Colors.white70 , size: 35,),
      ),
    );
  }
}
