import 'package:flutter/material.dart';

class ProteinCalculator extends StatefulWidget {
  const ProteinCalculator({super.key});

  @override
  State<ProteinCalculator> createState() => _ProteinCalculatorState();
}

class _ProteinCalculatorState extends State<ProteinCalculator> {

// Bool
 bool isVisible = false;
// Text editing controllers
  final weightController = TextEditingController();

// Required Protein variable
  double? ReqProtein;

// Protein calc function
  double proteincalc(double weight) {
    double value = 0;
    value = weight * 0.8;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey.shade300,
          elevation: 0,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Icon(
            Icons.calculate_rounded,
            size: 50,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Protein Calculator",
                style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Find out the exact amount of protien you need.",
            style: TextStyle(
                color: Colors.grey.shade900,
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Consuming the required amount of protein is really important. ",
            style: TextStyle(
                color: Colors.grey.shade900,
                fontSize: 13,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20,
          ),

          // Asking for current weight and desired weight
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              // controller: currentWeightController,
              decoration: InputDecoration(
                  hintText: "Enter your current weight (in kgs)",
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade900))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {
                String weightString = weightController.text;
                double weight = double.parse(weightString);
                setState(() {
                  ReqProtein = proteincalc(weight);
                });

                isVisible = true;

                weightController.clear();
              },
              child: Text(
                "Get Protein requirement",
                style: TextStyle(fontSize: 15),
              )),
          SizedBox(
            height: 20,
          ),
          Visibility(
            visible: isVisible,
            child: Column(
              children: [
                Text(
                  "Required Protein per day (in gms) : $ReqProtein\gms",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ), SizedBox(height: 10,),
                Text("Our diet plans offer advices that can help you ", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey.shade800),),
                Text("achieve these requirements.", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey.shade800),)
              ],
            ),
          )
        ]));
  }
}
