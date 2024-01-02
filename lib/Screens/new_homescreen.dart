import 'package:flutter/material.dart';
import 'package:workout_tracker/homeScreen_widgets/calculators.dart';
import 'package:workout_tracker/homeScreen_widgets/water_tracker.dart';
import 'package:workout_tracker/homeScreen_widgets/workout_diet.dart';
import 'package:workout_tracker/screens/settings_screen.dart';
import 'package:workout_tracker/components/curved_nav_bar.dart';
import 'package:workout_tracker/utils/app_theme.dart';


class HomeScreenMachTwo extends StatefulWidget {
  String? userName;
  HomeScreenMachTwo({
    super.key,
    this.userName
  });

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
                      "Welcome, ",
                      style: apptheme.titleText
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.userName.toString(),
                      style: apptheme.titleText
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
// ---------------------- WORKOUT AND DIET ----------------------
              WorkoutAndDiet(),
              SizedBox(
                height: 25,
              ),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ));
            },
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ))
      ],
    );
  }
}
