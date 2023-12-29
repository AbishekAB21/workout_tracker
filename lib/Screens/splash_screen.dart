import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_tracker/screens/data_collection_screen.dart';
import 'package:workout_tracker/screens/new_homescreen.dart';
import 'package:workout_tracker/utils/app_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String keylogin = "login";

  @override
  void initState() {
    whereToGo(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/DumbellNoBackground.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void whereToGo(BuildContext context) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool isVitalsCollected =
      pref.getBool(SharedPreferenceKeys.keyVitalsCollected) ?? false;

  await Future.delayed(Duration(seconds: 3));

  if (isVitalsCollected == true) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreenMachTwo(),
        ));
  } else {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DataCollectionScreen(),
        ));
  }
}
