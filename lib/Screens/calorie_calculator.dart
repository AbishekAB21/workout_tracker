import 'package:flutter/material.dart';

class CalorieCalculator extends StatefulWidget {
  const CalorieCalculator({super.key});

  @override
  State<CalorieCalculator> createState() => _CalorieCalculatorState();
}

// Radio button
List<String> genders = ['Male', 'Female'];

class _CalorieCalculatorState extends State<CalorieCalculator> {
// Bool
  bool isVisible = false;
// Text editing controllers
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final ageController = TextEditingController();

// Required Calorie variable
  double? ReqCalories;

// Calorie calc function
  double caloriecalc(double weight, double height, double age, String gender) {
    double value = 0;
    if (gender == "Male") {
      value = 66.5 + 13.8 * (weight) + 5 * (height) / 6.8 * age;
      return value;
    } else {
      value = 655.1 + 9.6 * (weight) + 1.9 * (height) / 4.7 * age;
      return value;
    }
  }

// Radio button
  String selectedGender = genders[0];

// Check if empty. if Empty show snackbar

  void checkControllers() {
    if (weightController.text.isEmpty ||
        heightController.text.isEmpty ||
        ageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Details should not be empty"),
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
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.deepPurple,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Icon(
              Icons.calculate_rounded,
              size: 50,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Calorie Calculator",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Find out the exact amount of calories you need.",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Take control of your daily calorie intake.",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 20,
            ),

            // Asking for current weight
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: weightController,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter your current weight (in kgs)",
                     hintStyle: TextStyle(color: Colors.white70),
                    fillColor: Colors.deepPurpleAccent.shade200,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent.shade200)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Asking for current height
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: heightController,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter your current height (in cms)",
                     hintStyle: TextStyle(color: Colors.white70),
                    fillColor: Colors.deepPurpleAccent.shade200,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent.shade200)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Asking for current age
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: ageController,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter your current age",
                     hintStyle: TextStyle(color: Colors.white70),
                    fillColor: Colors.deepPurpleAccent.shade200,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurpleAccent.shade200)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Male or Female
            Padding(
              padding: const EdgeInsets.only(left: 110),
              child: Column(
                children: [
                  RadioListTile(
                    title: const Text(
                      "Male",
                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white70),
                    ),
                    value: genders[0],
                    fillColor: MaterialStateProperty.all(Colors.white),
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text(
                      "Female",
                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white70),
                    ),
                    value: genders[1],
                    fillColor: MaterialStateProperty.all(Colors.white),
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value.toString();
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                    padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent.shade200)),
                onPressed: () {
                  checkControllers();
                  
                  String weightString = weightController.text;
                  String heightString = heightController.text;
                  String ageString = ageController.text;

                  double weight = double.parse(weightString);
                  double height = double.parse(heightString);
                  double age = double.parse(ageString);
                  String gender = selectedGender;
                  setState(() {
                    ReqCalories = caloriecalc(weight, height, age, gender);
                  });

                  isVisible = true;

                  weightController.clear();
                  heightController.clear();
                  ageController.clear();
                },
                child: Text(
                  "Get Calorie requirement",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )),
            SizedBox(
              height: 20,
            ),
            Visibility(
              visible: isVisible,
              child: Column(
                children: [
                  Text(
                    "Required Calories per day (in gms) : $ReqCalories\gms",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10,),
                  Text("Our diet plans offer advices that can help you ", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white70),),
                Text("achieve these requirements.", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white70),)
                ],
              ),
            )
          ]),
        ));
  }
}
