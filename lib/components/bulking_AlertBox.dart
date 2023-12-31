import 'package:flutter/material.dart';

class BulkingAlertBox extends StatelessWidget {
   BulkingAlertBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      title: Text(
        "Edit Diet Plan (Bulking)",
        style: TextStyle(color: Colors.white),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              
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
                hintText: "First tip",
                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              
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
