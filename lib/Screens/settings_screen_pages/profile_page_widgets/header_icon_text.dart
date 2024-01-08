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
            Container(
              height: 60,
              width: 60,
              child: Image.asset("assets/profile.png"),
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
