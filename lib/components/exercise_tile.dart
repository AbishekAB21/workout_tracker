import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:workout_tracker/utils/app_theme.dart';

// ignore: must_be_immutable
class ExerciseTile extends StatelessWidget {
  final String exerciseName;
  final String weight;
  final String reps;
  final String sets;
  final bool isCompleted;

  void Function(bool?)? onCheckBoxChanged;

  ExerciseTile({
    super.key,
    required this.exerciseName,
    required this.weight,
    required this.reps,
    required this.sets,
    required this.isCompleted,
    required this.onCheckBoxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
      color: apptheme.secondaryColor,
      child: Slidable(
        startActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(onPressed: (context) {
              // Edit
            },
            backgroundColor: Colors.yellow.shade700,
            icon: Icons.edit_rounded,foregroundColor: Colors.white,
            )
          ]
          ),
          endActionPane: ActionPane(
            motion: StretchMotion(), 
            children: [
              SlidableAction(onPressed: (context) {
                // Delete
              },
              backgroundColor: Colors.red,
              icon: Icons.delete_rounded,foregroundColor: Colors.white,
              )
            ]),
        child: ListTile(
          // dense: true,
          leading:
              // Icon(Icons.sports_gymnastics_rounded, color: Colors.white70 , size: 35,),
              Container(
                  height: 35,
                  width: 35,
                  child: Image.asset("assets/exercise.png")),
          title: Text(
            exerciseName,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          subtitle: Row(
            children: [
              // Weight
              Chip(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  side: BorderSide(color: apptheme.secondaryColor),
                  backgroundColor: apptheme.secondaryColor,
                  label: Text(
                    "${weight} kg",
                    style: apptheme.labelText,
                  )),
              const SizedBox(
                width: 5,
              ),
              // Reps
              Chip(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  side: BorderSide(color: apptheme.secondaryColor),
                  backgroundColor: apptheme.secondaryColor,
                  label: Text(
                    "${reps} Reps",
                    style: apptheme.labelText,
                  )),
              const SizedBox(
                width: 5,
              ),
              // Sets
              Chip(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  side: BorderSide(color: apptheme.secondaryColor),
                  backgroundColor: apptheme.secondaryColor,
                  label: Text(
                    "${sets} Sets",
                    style: apptheme.labelText,
                  )),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: isCompleted,
                onChanged: (value) => onCheckBoxChanged!(value),
                checkColor: Colors.white,
                activeColor: Colors.green[500],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
