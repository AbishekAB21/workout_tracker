import 'package:flutter/material.dart';
import 'package:workout_tracker/screens/data_collection_widgets/get_started-button.dart';
import 'package:workout_tracker/screens/data_collection_widgets/textfields.dart';
import 'package:workout_tracker/screens/data_collection_widgets/top_icon_text.dart';
import 'package:workout_tracker/screens/new_homescreen.dart';
import 'package:workout_tracker/utils/app_constants.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class DataCollectionScreen extends StatefulWidget {
  DataCollectionScreen({super.key});

  @override
  State<DataCollectionScreen> createState() => _DataCollectionScreenState();
}

class _DataCollectionScreenState extends State<DataCollectionScreen> {
  // Enum
  GenderEnum? _genderEnum;
  GoalEnum? _goalEnum;

  // Text Editing Controllers
  final TextEditingController displaynameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  // Selection bool
  bool WeightLossSelected = false;
  bool WeightGainSelected = false;

  @override
  void dispose() {
    displaynameController.dispose();
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apptheme.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),

              IconText(),

              SizedBox(
                height: 30,
              ),

              // Text Fields

              Textfields(
                controller: displaynameController,
                hintText: "Display Name",
                enableEditing: true,
              ),
              SizedBox(
                height: 10,
              ),
              Textfields(
                controller: ageController,
                hintText: "Age",
                enableEditing: true,
              ),
              SizedBox(
                height: 10,
              ),
              Textfields(
                controller: weightController,
                hintText: "Weight (in kgs)",
                enableEditing: true,
              ),
              SizedBox(
                height: 10,
              ),
              Textfields(
                controller: heightController,
                hintText: "Height (in cms)",
                enableEditing: true,
              ),
              SizedBox(
                height: 15,
              ),

              // gender
              Text(
                "Select Your Gender with Respect and Inclusivity.",
                style: apptheme.labelText,
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      updateGenderSelection(GenderEnum.male);
                    },
                    icon: Icon(Icons.male,
                        color: _genderEnum == GenderEnum.male
                            ? apptheme.foregroundColor
                            : apptheme.disabledColor),
                    iconSize: 48,
                  ),
                  IconButton(
                    onPressed: () {
                      updateGenderSelection(GenderEnum.female);
                    },
                    icon: Icon(
                      Icons.female,
                      color: _genderEnum == GenderEnum.female
                          ? apptheme.foregroundColor
                          : apptheme.disabledColor,
                    ),
                    iconSize: 48,
                  ),
                  IconButton(
                    onPressed: () {
                      updateGenderSelection(GenderEnum.others);
                    },
                    icon: Icon(
                      Icons.transgender,
                      color: _genderEnum == GenderEnum.others
                          ? apptheme.foregroundColor
                          : apptheme.disabledColor,
                    ),
                    iconSize: 48,
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Transform Your Body: Lose or Gain, Embrace the Change!",
                    style: apptheme.labelText,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: () {
                      updateGoalSelection(GoalEnum.weightgain);
                    },
                    icon: Container(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        "assets/weight_gain.png",
                        color: _goalEnum == GoalEnum.weightgain
                            ? apptheme.foregroundColor
                            : apptheme.disabledColor,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      updateGoalSelection(GoalEnum.weightloss);
                    },
                    icon: Container(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        "assets/weight_loss.png",
                        color: _goalEnum == GoalEnum.weightloss
                            ? apptheme.foregroundColor
                            : apptheme.disabledColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),

              GetStartedButton(
                onpress: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreenMachTwo(),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateGenderSelection(GenderEnum gender) {
    setState(() {
      _genderEnum = gender;
    });
  }

  void updateGoalSelection(GoalEnum goal) {
    setState(() {
      _goalEnum = goal;
    });
  }
}
