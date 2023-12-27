import 'package:flutter/material.dart';
import 'package:workout_tracker/Screens/diet_page.dart';
import 'package:workout_tracker/Screens/newdiet_page.dart';
import 'package:workout_tracker/Screens/workout_screen.dart';

class WorkoutAndDiet extends StatefulWidget {
  bool admin;
  WorkoutAndDiet({super.key, required this.admin});

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
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
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
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
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
                      builder: (context) => WorkoutScreen(
                        admin: widget.admin,
                      ),
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent.shade200,
                    borderRadius: BorderRadius.circular(5)),
                height: 100,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sports_gymnastics_rounded,
                      size: 40,
                      color: Colors.white70,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Workouts",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white70),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DietPlannerPage(
                        admin: widget.admin,
                      ),
                    ));
                // Navigator.push(context, MaterialPageRoute(builder: (context) => DietPage(),));
              },
              child: Container(
                margin: EdgeInsets.only(left: 50),
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent.shade200,
                    borderRadius: BorderRadius.circular(5)),
                height: 100,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fastfood_rounded,
                      size: 40,
                      color: Colors.white70,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Diet",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white70),
                    )
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
