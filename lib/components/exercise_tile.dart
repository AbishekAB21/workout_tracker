import 'package:flutter/material.dart';

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
      color: Colors.deepPurpleAccent.shade200,
      child: ListTile(
        // dense: true,
        leading:  Icon(Icons.sports_gymnastics_rounded, color: Colors.white70 , size: 35,),
        title: Text(
          exerciseName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        subtitle: Row(
          children: [
            // Weight
            Chip(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.symmetric(horizontal: 3),
              side: BorderSide(color: Colors.white),
                backgroundColor: Colors.deepPurpleAccent.shade200,
                label: Text(
                  "${weight} kg",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              width: 5,
            ),
            // Reps
            Chip(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.symmetric(horizontal: 3),
              side: BorderSide(color: Colors.white),
                backgroundColor: Colors.deepPurpleAccent.shade200,
                label: Text(
                  "${reps} Reps",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              width: 5,
            ),
            // Sets
            Chip(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.symmetric(horizontal: 3),
              side: BorderSide(color: Colors.white),
                backgroundColor: Colors.deepPurpleAccent.shade200,
                label: Text(
                  "${sets} Sets",
                  style: TextStyle(color: Colors.white),
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
    );
  }
}
