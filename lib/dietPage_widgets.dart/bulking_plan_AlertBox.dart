import 'package:flutter/material.dart';
import 'package:workout_tracker/data/diet_data.dart';

class BulkBox extends StatefulWidget {
  TextEditingController bulkDietPlanController = TextEditingController();
   BulkBox({super.key, required this.bulkDietPlanController});

  @override
  State<BulkBox> createState() => _BulkBoxState();
}

class _BulkBoxState extends State<BulkBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      title: Text(
        "Edit Bulking Diet Plan",
        style: TextStyle(color: Colors.white),
      ),
      content: TextField(
        style: TextStyle(color: Colors.white),
        controller: widget.bulkDietPlanController,
        decoration: InputDecoration(
          fillColor: Colors.deepPurpleAccent.shade200,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Updated File URL",
          hintStyle: TextStyle(color: Colors.white54),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Save or update the url on to hive
            DietData link = DietData();
            link.addBulkPlanPath(widget.bulkDietPlanController.text);
            print(link.BulkingPlan + " Link Exists");
            // give the variable here the value from hive
          },
          child: Text("Update", style: TextStyle(color: Colors.white70),),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel", style: TextStyle(color: Colors.white70)))
      ],
    );;
  }
}