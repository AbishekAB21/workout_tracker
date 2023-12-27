import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WaterTracker extends StatefulWidget {
  const WaterTracker({super.key});

  @override
  State<WaterTracker> createState() => _WaterTrackerState();
}

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

class _WaterTrackerState extends State<WaterTracker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Water Tracker",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              ),
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
              Text(
                "Monitor your daily water intake & stay hydrated !",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              ),
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
                progressColor: Colors.white70,
                backgroundColor: Colors.deepPurpleAccent.shade200,
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
                                IncreasewaterPercentage();
                              });
                            },
                            icon: Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.white70,
                            )),
                        Icon(
                          Icons.water_drop_rounded,
                          size: 30,
                          color: Colors.white70,
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                DecreaseWaterPercent();
                              });
                            },
                            icon: Icon(
                              Icons.remove,
                              size: 25,
                              color: Colors.white70,
                            )),
                      ],
                    ),
                    Text(
                      "Per Glass",
                      style: TextStyle(color: Colors.white70),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
