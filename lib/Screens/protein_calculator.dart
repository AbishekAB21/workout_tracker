import 'package:flutter/material.dart';
import 'package:workout_tracker/utils/app_theme.dart';

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

// SnackBar
  void checkCntrls() {
    if (weightController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please enter current weight"),
        backgroundColor: Colors.red,
        closeIconColor: Colors.white,
        showCloseIcon: true,
        duration: Duration(seconds: 5),
        dismissDirection: DismissDirection.down,
        elevation: 2,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: apptheme.primaryColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: apptheme.foregroundColor),
          backgroundColor: apptheme.primaryColor,
          elevation: 0,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          // Icon(
          //   Icons.calculate_rounded,
          //   size: 50,
          //   color: Colors.white,
          // ),
          Container(
            height: 60,
            width: 60,
            child: Image.asset("assets/protein.png"),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Protein Calculator", style: apptheme.titleText),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text("Find out the exact amount of protien you need.",
              style: apptheme.labelText),
          SizedBox(
            height: 6,
          ),
          Text("Consuming the required amount of protein is really important. ",
              style: apptheme.labelText,
              textAlign: TextAlign.center,
              ),
          SizedBox(
            height: 20,
          ),

          // Asking for current weight and desired weight
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: weightController,
              style: apptheme.inputText,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter your current weight (in kgs)",
                  hintStyle: apptheme.hintText,
                  fillColor: apptheme.primaryColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: apptheme.borderColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: apptheme.borderColor))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 220,
            decoration: BoxDecoration(
                color: apptheme.secondaryColor,
                borderRadius: BorderRadius.circular(5)),
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                    padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                    backgroundColor: MaterialStateProperty.all(
                      apptheme.secondaryColor,
                    )),
                onPressed: () {
                  checkCntrls();

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
                  style: apptheme.titleText,
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Visibility(
            visible: isVisible,
            child: Column(
              children: [
                Text(
                  "Required Protein per day (in gms) : $ReqProtein\gms",
                  style: apptheme.titleText
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ]));
  }
}
