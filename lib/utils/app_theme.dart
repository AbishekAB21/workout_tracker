import 'package:flutter/material.dart';

AppTheme apptheme = AppDefaultTheme();

abstract class AppTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color borderColor;
  final Color foregroundColor;
  final Color disabledColor;
  final TextStyle inputText;
  final TextStyle labelText;
  final TextStyle hintText;
  final TextStyle buttonTextColor;
  final TextStyle titleText;
  final Color SnackBarColor;

  AppTheme(
      {required this.primaryColor,
      required this.secondaryColor,
      required this.borderColor,
      required this.foregroundColor,
      required this.disabledColor,
      required this.inputText,
      required this.labelText,
      required this.hintText,
      required this.buttonTextColor,
      required this.titleText,
      required this.SnackBarColor
      });
}

class AppDefaultTheme extends AppTheme {
  AppDefaultTheme()
      : super(
          primaryColor: Colors.deepPurple,
          secondaryColor: Colors.deepPurpleAccent.shade200,
          borderColor: Colors.white54,
          foregroundColor: Colors.white,
          disabledColor: Colors.white38,
          inputText: TextStyle(color: Colors.white, fontSize: 12),
          labelText: TextStyle(color: Colors.white54, fontSize: 15),
          hintText: TextStyle(color: Colors.white54, fontSize: 12),
          buttonTextColor: TextStyle(color: Colors.white),
          titleText: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          SnackBarColor: Colors.red,
        );
}
