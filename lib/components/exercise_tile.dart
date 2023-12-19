import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
      color: Colors.grey[800],
      child: ListTile(
        // dense: true,
        leading: Image.asset("assets/DumbellForInsideApp.png"),
        title: Text(
          exerciseName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        subtitle: Row(
          children: [
            // Weight
            Chip(label: Text("${weight} kg")),
            const SizedBox(
              width: 5,
            ),
            // Reps
            Chip(label: Text("${reps} Reps")),
            const SizedBox(
              width: 5,
            ),
            // Sets
            Chip(label: Text("${sets} Sets")),
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
