import 'package:flutter/material.dart';

class Goals extends StatelessWidget {
  bool WeightLossSelected;
  bool WeightGainSelected;
  Goals(
      {super.key,
      required this.WeightLossSelected,
      required this.WeightGainSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 100,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.deepPurpleAccent.shade200,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Weight Loss",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Checkbox(
                value: WeightLossSelected,
                onChanged: (value) => null,
                checkColor: Colors.white,
                activeColor: Colors.green[500],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 100,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.deepPurpleAccent.shade200,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Weight Gain",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Checkbox(
                value: WeightLossSelected,
                onChanged: (value) => null,
                checkColor: Colors.white,
                activeColor: Colors.green[500],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
