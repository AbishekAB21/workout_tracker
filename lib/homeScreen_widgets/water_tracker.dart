import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:workout_tracker/models/water.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class WaterTracker extends StatefulWidget {
  const WaterTracker({super.key});

  @override
  State<WaterTracker> createState() => _WaterTrackerState();
}


class _WaterTrackerState extends State<WaterTracker> {

// Water percentage
double waterPercent = 0;

// Increase water percentage
void IncreasewaterPercentage() {
  if (waterPercent == 0.9999999999999999) {
    waterPercent = waterPercent;
  } else {
    waterPercent = waterPercent + 0.1;
  }
  print("$waterPercent");
}

// Decrease water percentage
void DecreaseWaterPercent() {
  if (waterPercent == -0.09999999999999999) {
    waterPercent = 0.0;
  } else if (waterPercent > 0.10000000000000003) {
    waterPercent = waterPercent - 0.1;
  } else if (waterPercent == 0.10000000000000003) {
    waterPercent = waterPercent - 0.10000000000000003;
  }
  print("$waterPercent");
}

  // Hive
  late Box<Water> waterBox;

  @override
  void initState() {
    super.initState();

    waterBox = Hive.box<Water>('waterbox');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Water Tracker", style: apptheme.titleText),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Monitor your daily water intake & stay hydrated !",
                  style: apptheme.labelText),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularPercentIndicator(
                radius: 100,
                lineWidth: 15,
                progressColor: apptheme.waterColor,
                backgroundColor: apptheme.disabledColor,
                percent: waterPercent,
                circularStrokeCap: CircularStrokeCap.round,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                DecreaseWaterPercent();
                              });
                              _updateHive();
                            },
                            icon:
                                Container(
                              height: 20,
                              width: 20,
                              child: Image.asset("assets/minus.png"),
                            )),
                        Container(
                            height: 25,
                            width: 25,
                            child: Image.asset("assets/water.png")),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                IncreasewaterPercentage();
                              });
                              _updateHive();
                            },
                            icon:
                                Container(
                              height: 20,
                              width: 20,
                              child: Image.asset("assets/plus.png"),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void _updateHive() {
    waterBox.put('waterkey', Water(waterPercent: waterPercent));
  }
}
