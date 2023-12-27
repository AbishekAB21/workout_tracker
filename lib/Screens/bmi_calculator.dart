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

  // SnackBar
  void checkCntrls() {
    if (heightController.text.isEmpty || weightController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Height or weight should not be empty"),
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
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
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
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Calculate your BMI (Body Mass Index)",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "This will help you in configuring the perfect workout plan.",
                        style: TextStyle(
                          color: Colors.white,
                        ),
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
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.white54)),
                    filled: true,
                    fillColor: Colors.deepPurpleAccent.shade200,
                    hintText: "Enter your height (In cms)",
                    hintStyle: TextStyle(color: Colors.white70),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent.shade200)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: weightController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.white54)),
                      filled: true,
                      fillColor: Colors.deepPurpleAccent.shade200,
                      hintText: "Enter your Weight (In kgs)",
                      hintStyle: TextStyle(color: Colors.white70),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: Colors.deepPurpleAccent.shade200))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                      backgroundColor: MaterialStateProperty.all(
                          Colors.deepPurpleAccent.shade200)),
                  onPressed: () {
                    checkCntrls();

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
                  child: Text(
                    "Calculate BMI",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
              SizedBox(
                height: 20,
              ),
              Visibility(
                  visible: isVisible,
                  child: Text(
                    "BMI = $BMI",
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                "$WeightStatus",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 10),
              Card(
                color: Colors.deepPurpleAccent.shade200,
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: 300,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "BMI <18.5",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Underweight",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "BMI 18.5 - 24.9",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Normal Weight",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "BMI 25-29.9",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Overweight",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "BMI > 31",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Obese",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
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
