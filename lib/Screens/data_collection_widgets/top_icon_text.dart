import 'package:flutter/material.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class IconText extends StatelessWidget {
  const IconText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          
          child: Image.asset("assets/DumbellNoBackground.png"),
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