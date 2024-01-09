import 'package:flutter/material.dart';
import 'package:workout_tracker/screens/settings_screen_pages/profile_page.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class EditAlertBox extends StatefulWidget {
  final bool enableEditing;

  EditAlertBox({
    super.key,
    required this.enableEditing,
  });

  @override
  State<EditAlertBox> createState() => _EditAlertBoxState();
}

class _EditAlertBoxState extends State<EditAlertBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: apptheme.primaryColor,
      content: Text(
        "Are you sure you want to edit ?",
        style: apptheme.labelText,
      ),
      title: Text(
        "Enabling Editing",
        style: apptheme.titleText,
      ),
      actions: [
        TextButton(
            onPressed: () {
              enableEditing = true;
              Navigator.pop(context);
              setState(() {
                // trigger a rebuild
              });
            },
            child: Text(
              "Yes",
              style:apptheme.buttonTextColor,
            )),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: apptheme.buttonTextColor,
            ))
      ],
    );
  }
}
