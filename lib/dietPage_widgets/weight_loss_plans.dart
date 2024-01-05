import 'package:flutter/material.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class WeightLossPlans extends StatefulWidget {
  const WeightLossPlans({super.key});

  @override
  State<WeightLossPlans> createState() => _WeightLossPlansState();
}

class _WeightLossPlansState extends State<WeightLossPlans> {
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
                      "assets/weight_loss.png",
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