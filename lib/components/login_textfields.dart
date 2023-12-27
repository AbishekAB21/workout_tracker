import 'package:flutter/material.dart';

class LoginTextfields extends StatelessWidget {

  final controller;
  final String hintText;
  final bool obscureText;
  const LoginTextfields({super.key,
  required this.controller,
  required this.hintText,
  required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white54)),
          filled: true,
          fillColor: Colors.deepPurpleAccent.shade200,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white54),
        ),
      ),
    );
  }
}
