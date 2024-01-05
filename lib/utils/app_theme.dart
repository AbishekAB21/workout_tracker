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
  final Color waterColor;
  final TextStyle listText;

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
      required this.SnackBarColor,
      required this.waterColor,
      required this.listText
      });
}

class AppDefaultTheme extends AppTheme {
  AppDefaultTheme()
      : super(
          primaryColor: Colors.grey.shade300,
          secondaryColor: Colors.green.shade600,
          borderColor: Colors.grey,
          foregroundColor: Colors.black,
          disabledColor: Colors.grey,
          inputText: TextStyle(color: Colors.black, fontSize: 12),
          labelText: TextStyle(color: Colors.black, fontSize: 15),
          hintText: TextStyle(color: Colors.grey, fontSize: 12),
          buttonTextColor: TextStyle(color: Colors.white),
          titleText: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          SnackBarColor: Colors.red,
          waterColor: Colors.blue.shade600,
          listText: TextStyle(
              color: Colors.grey.shade300, fontSize: 16, fontWeight: FontWeight.w600),
        );
}
