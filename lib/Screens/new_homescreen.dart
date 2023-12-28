import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_tracker/HomeScreenWidgets%20/calculators.dart';
import 'package:workout_tracker/HomeScreenWidgets%20/water_tracker.dart';
import 'package:workout_tracker/HomeScreenWidgets%20/workout_diet.dart';
import 'package:workout_tracker/Screens/login_screen.dart';
import 'package:workout_tracker/Screens/settings_screen.dart';
import 'package:workout_tracker/Screens/splash_screen.dart';
import 'package:workout_tracker/components/curved_nav_bar.dart';

// URL Launcher

class HomeScreenMachTwo extends StatefulWidget {
  HomeScreenMachTwo({super.key,});

  @override
  State<HomeScreenMachTwo> createState() => _HomeScreenMachTwoState();
}

class _HomeScreenMachTwoState extends State<HomeScreenMachTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: _homeAppBar(context),
        bottomNavigationBar: CurvedNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset("assets/DumbellNoBackground.png")),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Welcome !",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Visibility(
                      visible: false,
                      child: Text(
                        "Admin",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
// ---------------------- WORKOUT AND DIET ----------------------
              // WorkoutAndDiet(
              //   admin: widget.isAdmin,
              // ),
              // SizedBox(
              //   height: 25,
              // ),
// ---------------------- WATER TRACKER ----------------------
              WaterTracker(),
              // call the circular progress indicator for the water consumption
              // reduce the height of this sized box below
              SizedBox(
                height: 25,
              ),
// ---------------------- CALCULATORS ----------------------
              Calculators(),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ));
  }

// ---------------------- APP BAR ----------------------

  AppBar _homeAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      toolbarHeight: 35,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {
              // showDialog(
              //   context: context,
              //   builder: (context) {
              //     return AlertDialog(
              //       backgroundColor: Colors.deepPurple,
              //       content: Text("Are you sure you want to log out ?",
              //           style: TextStyle(color: Colors.white)),
              //       title: Text(
              //         "Log off",
              //         style: TextStyle(color: Colors.white),
              //       ),
              //       actions: [
              //         // Yes
              //         TextButton(
              //             onPressed: () async {
              //               // changes shared pref value to false from true
              //               var sharedpref =
              //                   await SharedPreferences.getInstance();
              //               sharedpref.setBool(
              //                   SplashScreenState.keylogin, false);

              //               Navigator.pushReplacement(
              //                   context,
              //                   MaterialPageRoute(
              //                     builder: (context) => LoginScreen(),
              //                   ));
              //             },
              //             child: Text("Yes",
              //                 style: TextStyle(color: Colors.white))),

              //         // Cancel
              //         TextButton(
              //             onPressed: () {
              //               Navigator.pop(context);
              //             },
              //             child: Text("Cancel",
              //                 style: TextStyle(color: Colors.white70)))
              //       ],
              //     );
              //   },
              // );

              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen(),));
            },
            icon: Icon(Icons.settings, color: Colors.white,))
      ],
    );
  }
}
