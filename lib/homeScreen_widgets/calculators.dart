import 'package:flutter/material.dart';
import 'package:workout_tracker/screens/bmi_calculator.dart';
import 'package:workout_tracker/screens/calorie_calculator.dart';
import 'package:workout_tracker/screens/protein_calculator.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class Calculators extends StatefulWidget {
  const Calculators({super.key});

  @override
  State<Calculators> createState() => _CalculatorsState();
}

class _CalculatorsState extends State<Calculators> {
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
                      "Calculators",
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
                      "Monitor your BMI, Protein intake & Calorie intake.",
                      style: apptheme.labelText,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => BMICalculator(),));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: apptheme.primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        height: 100,
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              child: Image.asset("assets/BMI.png"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProteinCalculator(),));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: apptheme.primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        height: 100,
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              child: Image.asset("assets/protein.png"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => CalorieCalculator(),));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: apptheme.primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        height: 100,
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              child: Image.asset("assets/calories.png"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}