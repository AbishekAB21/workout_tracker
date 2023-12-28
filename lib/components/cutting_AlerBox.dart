import 'package:flutter/material.dart';
import 'package:workout_tracker/data/diet_data.dart';

// ignore: must_be_immutable
class CuttingAlertBox extends StatelessWidget {
  CuttingAlertBox({
    super.key,
    required this.tip1,
    required this.tip2,
    required this.tip3,
    required this.tip4,
    required this.tip5,
  });

  TextEditingController tip1 = TextEditingController();
  TextEditingController tip2 = TextEditingController();
  TextEditingController tip3 = TextEditingController();
  TextEditingController tip4 = TextEditingController();
  TextEditingController tip5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      title: Text(
        "Edit Diet Plan (Cutting)",
        style: TextStyle(color: Colors.white70),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: tip1,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.deepPurpleAccent.shade200,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent.shade200)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "First tip",
                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: tip2,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.deepPurpleAccent.shade200,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Second tip",
                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: tip3,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.deepPurpleAccent.shade200,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Third tip",
                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: tip4,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.deepPurpleAccent.shade200,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Fourth tip",
                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: tip5,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.deepPurpleAccent.shade200,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Fifth tip",
                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              // String tip1 =
              // String tip2 =
              // String tip3 =
              // String tip4 =
              // String tip5 =
     DietData dietData = DietData();
              dietData.addCutTip(
                  tip1.text, tip2.text, tip3.text, tip4.text, tip5.text);
              print(dietData.cutDietTips.length);

              Navigator.pop(context);
            },
            child: Text(
              "Update",
              style: TextStyle(color: Colors.white),
            )),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
