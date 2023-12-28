import 'package:flutter/material.dart';

class Textfields extends StatelessWidget {
  final controller;
  final String hintText;
  bool enableEditing;
  Textfields({super.key, required this.controller, required this.hintText, required this.enableEditing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
        enabled: enableEditing,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
          filled: true,
          fillColor: Colors.deepPurpleAccent.shade200,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white54),
        ),
      ),
    );
  }
}