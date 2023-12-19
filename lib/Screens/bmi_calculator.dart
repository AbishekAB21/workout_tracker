

import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {

// Bool
 bool isVisible = false;

// BMI Value
  double? BMI;
  String WeightStatus = " ";

// text editing controllers
  final heightController = TextEditingController();

  final weightController = TextEditingController();

// BMI Calculator function
  double calculateBMI(double height, double Weight) {
    double BMI_Index = 0;
    BMI_Index = (Weight / (height * height)) * 10000;
    double? BMI_Val;
    BMI_Val = BMI_Index;
    if (BMI_Val < 18.5) {
      WeightStatus = "Underweight";
    } else if (BMI_Val >= 18.5 && BMI_Val <= 24.9) {
      WeightStatus = "Normal Weight";
    } else if (BMI_Val > 24.9 && BMI_Val <= 29.9) {
      WeightStatus = "Overweight";
    } else if (BMI_Val >= 31) {
      WeightStatus = "Obese";
    }
    return BMI_Val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.grey[300],
        elevation: 0,
        iconTheme: IconThemeData(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Icon(
                        Icons.calculate_rounded,
                        size: 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Calculate your BMI (Body Mass Index)",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "This will help you in configuring the perfect workout plan.",
                        style: TextStyle(color: Colors.grey[800]),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: heightController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey.shade700)),
                      filled: true,
                      fillColor: Colors.grey[300],
                      hintText: "Enter your height (In cms)",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey.shade700)),
                      filled: true,
                      fillColor: Colors.grey[300],
                      hintText: "Enter your Weight (In kgs)",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () {
                    String height = heightController.text;
                    String Weight = weightController.text;

                    double heightValue = double.parse(height);
                    double weightValue = double.parse(Weight);

                    setState(() {
                      BMI = calculateBMI(heightValue, weightValue);
                    });

                    heightController.clear();
                    weightController.clear();

                    isVisible = true;
                  },
                  child: Text("Calculate BMI")),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: isVisible ,
                child: Text("BMI = $BMI")),
              SizedBox(
                height: 10,
              ),
              Text(
                "$WeightStatus",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Card(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: 300,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text("BMI <18.5"), Text("Underweight")],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("BMI 18.5 - 24.9"),
                          Text("Normal Weight")
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text("BMI 25-29.9"), Text("Overweight")],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text("BMI > 31"), Text("Obese")],
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
