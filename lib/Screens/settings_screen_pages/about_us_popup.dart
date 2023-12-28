import 'package:flutter/material.dart';

class AboutUsPopUp extends StatefulWidget {
  const AboutUsPopUp({super.key});

  @override
  State<AboutUsPopUp> createState() => _AboutUsPopUpState();
}

class _AboutUsPopUpState extends State<AboutUsPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      title: Text(
        "About us",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
