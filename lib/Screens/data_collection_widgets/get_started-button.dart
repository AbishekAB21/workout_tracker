import 'package:flutter/material.dart';
import 'package:workout_tracker/Screens/new_homescreen.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.only(top: 20, bottom: 20, right: 50, left: 50)),
            backgroundColor:
                MaterialStateProperty.all(Colors.deepPurpleAccent.shade200),
            shape: MaterialStateProperty.all(ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(13)))),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreenMachTwo(),
              ));
        },
        child: Text(
          "Get Started",
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ));
  }
}
