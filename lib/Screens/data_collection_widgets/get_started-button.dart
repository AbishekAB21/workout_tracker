import 'package:flutter/material.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class GetStartedButton extends StatelessWidget {
  final VoidCallback onpress;
  const GetStartedButton({super.key, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(5),
            padding: MaterialStateProperty.all(
                EdgeInsets.only(top: 30, bottom: 30, right: 80, left: 80)),
            backgroundColor:
                MaterialStateProperty.all(apptheme.secondaryColor),
            shape: MaterialStateProperty.all(ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(13)))),
        onPressed: onpress, 
        child: Text(
          "Get Started",
          style: apptheme.titleText,
        ));
  }
}
