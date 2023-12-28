import 'package:flutter/material.dart';

class ProfileIconText extends StatelessWidget {
  const ProfileIconText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Icon(
              Icons.person_4_rounded,
              size: 50,
              color: Colors.white,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Your Profile",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }
}
