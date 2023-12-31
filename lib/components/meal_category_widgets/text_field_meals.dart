import 'package:flutter/material.dart';
import 'package:workout_tracker/utils/app_theme.dart';

// ignore: must_be_immutable
class MealsTextFields extends StatefulWidget {
  TextEditingController Controller = TextEditingController();
  String hinttext;
  String label;
  MealsTextFields(
      {super.key,
      required this.Controller,
      required this.hinttext,
      required this.label});

  @override
  State<MealsTextFields> createState() => _MealsTextFieldsState();
}

class _MealsTextFieldsState extends State<MealsTextFields> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.Controller,
      style: apptheme.inputText,
      decoration: InputDecoration(
        hintText: widget.hinttext,
        hintStyle: apptheme.hintText,
        label: Text(
          widget.label,
          style: apptheme.labelText,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: apptheme.borderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: apptheme.disabledColor)),
        fillColor: apptheme.primaryColor,
        filled: true,
      ),
    );
  }
}
