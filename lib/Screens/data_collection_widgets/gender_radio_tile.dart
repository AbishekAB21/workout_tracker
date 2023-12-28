import 'package:flutter/material.dart';
import 'package:workout_tracker/screens/calorie_calculator.dart';

class GenderRadioTile extends StatefulWidget {
  List genders;
  String selectedGender;
  GenderRadioTile({super.key, required this.genders , required this.selectedGender});

  @override
  State<GenderRadioTile> createState() => _GenderRadioTileState();
}

class _GenderRadioTileState extends State<GenderRadioTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(left: 130),
              child: Column(
                children: [
                  RadioListTile(
                    title: const Text(
                      "Male",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white70),
                    ),
                    value: widget.genders[0],
                    fillColor: MaterialStateProperty.all(Colors.white),
                    groupValue: widget.selectedGender,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedGender = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text(
                      "Female",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white70),
                    ),
                    value: widget.genders[1],
                    fillColor: MaterialStateProperty.all(Colors.white),
                    groupValue: widget.selectedGender,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedGender = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text(
                      "Other",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white70),
                    ),
                    value: widget.genders[2],
                    fillColor: MaterialStateProperty.all(Colors.white),
                    groupValue: widget.selectedGender,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedGender = value.toString();
                      });
                    },
                  ),
                ],
              ),
            );
  }
}