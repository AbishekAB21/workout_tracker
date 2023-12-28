import 'package:flutter/material.dart';
import 'package:workout_tracker/screens/settings_screen_pages/profile_page.dart';

class EditAlertBox extends StatefulWidget {
  bool enableEditing;
  EditAlertBox({super.key, required this.enableEditing});

  @override
  State<EditAlertBox> createState() => _EditAlertBoxState();
}

class _EditAlertBoxState extends State<EditAlertBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: Text(
        "Are you sure you want to edit ?",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      title: Text(
        "Enabling Editing",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      actions: [
        TextButton(
            onPressed: () {
              setState(() {
                enableEditing = true;
              });
              Navigator.pop(context);
            },
            child: Text(
              "Yes",
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
