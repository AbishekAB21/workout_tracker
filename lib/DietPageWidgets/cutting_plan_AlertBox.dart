import 'package:flutter/material.dart';
import 'package:workout_tracker/data/diet_data.dart';

class CutBox extends StatefulWidget {
  TextEditingController cutDietPlanController = TextEditingController();
  CutBox({super.key, required this.cutDietPlanController});

  @override
  State<CutBox> createState() => _CutBoxState();
}

class _CutBoxState extends State<CutBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      title: Text(
        "Edit Cutting Diet Plan",
        style: TextStyle(color: Colors.white),
      ),
      content: TextField(
        style: TextStyle(color: Colors.white),
        controller: widget.cutDietPlanController,
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
            DietData().addCutPlanPath(widget.cutDietPlanController.text);
            widget.cutDietPlanController.clear();
            Navigator.pop(context);
            // give the variable here the value from hive
          },
          child: Text("Update",style: TextStyle(color: Colors.white70),),
        ),
        TextButton(
            onPressed: () {
              // Save or update the url on to hive
              // give the variable here the value from hive
              Navigator.pop(context);
            },
            child: Text("Cancel",style: TextStyle(color: Colors.white70)))
      ],
    );
  }
}
