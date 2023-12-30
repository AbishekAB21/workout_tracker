import 'package:flutter/material.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class WeightGainPlans extends StatefulWidget {
  const WeightGainPlans({super.key});

  @override
  State<WeightGainPlans> createState() => _WeightGainPlansState();
}

class _WeightGainPlansState extends State<WeightGainPlans> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
                onPressed: null,
                icon: Container(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      "assets/weight_gain.png",
                      color: apptheme.foregroundColor,
                    ))),
            SizedBox(
              height: 4,
            ),
          ],
        ),
      ],
    );
  }
}