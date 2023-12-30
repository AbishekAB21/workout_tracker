import 'package:flutter/material.dart';

class SaveChangesButton extends StatefulWidget {
  /* Ask for the controllers from profile screen pass 
  them from there as texts and after using parse */
  const SaveChangesButton({super.key});

  @override
  State<SaveChangesButton> createState() => _SaveChangesButtonState();
}

class _SaveChangesButtonState extends State<SaveChangesButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Colors.deepPurpleAccent.shade200),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7)))),
        onPressed: () {},
        child: Text(
          "Save Changes",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ));
  }
}
