import 'package:flutter/material.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class IconText extends StatelessWidget {
  const IconText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.list_rounded,
          size: 50,
          color: apptheme.foregroundColor,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Fuel Your Fitness Adventure – Begin Your Transformation Now!",
          style: apptheme.titleText,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}