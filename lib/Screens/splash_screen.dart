import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_tracker/screens/data_collection_screen.dart';
import 'package:workout_tracker/screens/home_screen.dart';
import 'package:workout_tracker/screens/login_screen.dart';
import 'package:workout_tracker/screens/new_homescreen.dart';

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
//  var sharedpref = await SharedPreferences.getInstance();
//  var isloggedin = sharedpref.getBool(SplashScreenState.keylogin);

  Timer(Duration(seconds: 3), () {
    // if(isloggedin != null){
    //   if(isloggedin){
    //    Navigator.pushReplacement(context, MaterialPageRoute
    //    (builder: (context) => HomeScreenMachTwo(),));
    //   }else{
    //     Navigator.pushReplacement(context, MaterialPageRoute
    //    (builder: (context) => LoginScreen(),));
    //   }
    // }else{
    //     Navigator.pushReplacement(context, MaterialPageRoute
    //    (builder: (context) => LoginScreen(),));
    //   }

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DataCollectionScreen(),
        ));
  });
}
