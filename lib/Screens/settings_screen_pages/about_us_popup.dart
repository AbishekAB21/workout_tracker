import 'package:flutter/material.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class AboutUsPopUp extends StatefulWidget {
  const AboutUsPopUp({super.key});

  @override
  State<AboutUsPopUp> createState() => _AboutUsPopUpState();
}

class _AboutUsPopUpState extends State<AboutUsPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: apptheme.primaryColor,
      title: Text(
        "About us",
        style: apptheme.titleText,
      ),
      content: Text(
          "This is a fitness application that lets you track your workouts , diet , hydration and monitor other health related metrics like BMI value, Protein and Calorie requirements.",
          style: apptheme.labelText,
          textAlign: TextAlign.justify,
          ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "OK",
              style: apptheme.buttonTextColor,
            ))
      ],
    );
  }
}
