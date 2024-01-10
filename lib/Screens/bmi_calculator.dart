import 'package:flutter/material.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class BMICalculator extends StatefulWidget {
  BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
// Bool
  bool isVisible = false;

// BMI Value
  String? BMI;
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
      backgroundColor: apptheme.primaryColor,
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: apptheme.primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: apptheme.foregroundColor),
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
                      Container(
                        height: 60,
                        width: 60,
                        child: Image.asset("assets/BMI.png"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Calculate your BMI (Body Mass Index)",
                        style: apptheme.titleText
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "This will help you in configuring the perfect workout plan.",
                        style: apptheme.labelText
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
                  style: apptheme.inputText,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: apptheme.borderColor)),
                    filled: true,
                    fillColor: apptheme.primaryColor,
                    hintText: "Enter your height (In cms)",
                    hintStyle: apptheme.hintText,
                    label: Text("Height", style: apptheme.labelText,),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: apptheme.borderColor)),
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
                  style: apptheme.inputText,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: apptheme.borderColor)),
                      filled: true,
                      fillColor: apptheme.primaryColor,
                      label: Text("Weight", style: apptheme.labelText,),
                      hintText: "Enter your Weight (In kgs)",
                      hintStyle: apptheme.hintText,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: apptheme.borderColor))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: apptheme.secondaryColor,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                        backgroundColor: MaterialStateProperty.all(
                            apptheme.secondaryColor)),
                    onPressed: () {
                      checkCntrls();
                
                      String height = heightController.text;
                      String Weight = weightController.text;
                
                      double heightValue = double.parse(height);
                      double weightValue = double.parse(Weight);
                
                      setState(() {
                        BMI = calculateBMI(heightValue, weightValue).toStringAsFixed(2);
                      });
                
                      heightController.clear();
                      weightController.clear();
                
                      isVisible = true;
                    },
                    child: Text(
                      "Calculate BMI",
                      style: apptheme.titleText
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                  visible: isVisible,
                  child: Text(
                    "BMI = $BMI",
                    style: apptheme.labelText,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                "$WeightStatus",
                style: apptheme.titleText
              ),
              SizedBox(height: 10),
              Card(
                color: apptheme.secondaryColor,
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
