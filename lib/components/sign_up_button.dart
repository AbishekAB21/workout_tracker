import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  final Function()? onTap;
  const SignUpButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent.shade200,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Text(
          "Sign Up", 
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
            ),),
      ),
    );
  }
}