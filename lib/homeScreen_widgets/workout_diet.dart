import 'package:flutter/material.dart';
import 'package:workout_tracker/screens/newdiet_page.dart';
import 'package:workout_tracker/screens/workout_screen.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class WorkoutAndDiet extends StatefulWidget {
  WorkoutAndDiet({
    super.key,
  });

  @override
  State<WorkoutAndDiet> createState() => _WorkoutAndDietState();
}

class _WorkoutAndDietState extends State<WorkoutAndDiet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Workouts & Diets",
                style: apptheme.titleText
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Record your daily workouts & pick a diet plan.",
                style: apptheme.labelText
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutScreen(),
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: apptheme.secondaryColor,
                    borderRadius: BorderRadius.circular(5)),
                height: 100,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(
                    //   Icons.sports_gymnastics_rounded,
                    //   size: 40,
                    //   color: Colors.white70,
                    // ),
                    Container(
                      height: 60,
                      width: 60,
                      child: Image.asset("assets/weightlifting.png")),
                    SizedBox(
                      height: 5,
                    ),
                    // Text(
                    //   "Workouts",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold, color: Colors.white70),
                    // )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DietPlannerPage(),
                    ));
                // Navigator.push(context, MaterialPageRoute(builder: (context) => DietPage(),));
              },
              child: Container(
                margin: EdgeInsets.only(left: 50),
                decoration: BoxDecoration(
                    color: apptheme.secondaryColor,
                    borderRadius: BorderRadius.circular(5)),
                height: 100,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(
                    //   Icons.fastfood_rounded,
                    //   size: 40,
                    //   color: Colors.white70,
                    // ),
                    Container(
                      height: 60,
                      width: 60,
                      child: Image.asset("assets/diet.png"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // Text(
                    //   "Diet",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold, color: Colors.white70),
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
