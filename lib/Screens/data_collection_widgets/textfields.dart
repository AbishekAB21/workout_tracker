import 'package:flutter/material.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class Textfields extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool enableEditing;
  Textfields({super.key, required this.controller, required this.hintText, required this.enableEditing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: controller,
        style: apptheme.inputText,
        enabled: enableEditing,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: apptheme.borderColor)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: apptheme.borderColor)),
          filled: true,
          fillColor: apptheme.primaryColor,
          hintText: hintText,
          hintStyle: apptheme.hintText,
          label: Text(hintText),
          labelStyle: apptheme.labelText
        ),
      ),
    );
  }
}
