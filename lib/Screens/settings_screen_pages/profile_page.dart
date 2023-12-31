import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_tracker/Screens/data_collection_widgets/textfields.dart';
import 'package:workout_tracker/models/profile_model.dart';
import 'package:workout_tracker/screens/settings_screen_pages/profile_page_widgets/edit_alert_box.dart';
import 'package:workout_tracker/screens/settings_screen_pages/profile_page_widgets/header_icon_text.dart';
import 'package:workout_tracker/utils/app_constants.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

// Enums
GenderEnum? _genderEnum;
GoalEnum? _goalEnum;

// Text Editing Controllers
final TextEditingController displaynameController = TextEditingController();
final TextEditingController ageController = TextEditingController();
final TextEditingController weightController = TextEditingController();
final TextEditingController heightController = TextEditingController();

// Enable editing bool
bool enableEditing = false;
//bool result = false;

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: apptheme.primaryColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: apptheme.foregroundColor),
          backgroundColor: apptheme.primaryColor,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => EditAlertBox(
                            enableEditing: enableEditing,
                          ));
                },
                icon: Icon(Icons.edit_rounded))
          ],
        ),
        body: FutureBuilder(
          future: Hive.openBox<ProfileModel>(HiveKeys.boxProfile),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Box<ProfileModel> profiles =
                  Hive.box<ProfileModel>(HiveKeys.boxProfile);

              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfileIconText(),
                      SizedBox(
                        height: 30,
                      ),
                      Textfields(
                        controller: displaynameController,
                        hintText: profiles.values.first.displayName,
                        enableEditing: enableEditing,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Textfields(
                        controller: ageController,
                        hintText: profiles.values.first.age.toString(),
                        enableEditing: enableEditing,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Textfields(
                        controller: weightController,
                        hintText: profiles.values.first.weight.toString(),
                        enableEditing: enableEditing,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Textfields(
                        controller: heightController,
                        hintText: profiles.values.first.height.toString(),
                        enableEditing: enableEditing,
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      // gender
                      Visibility(
                        visible: enableEditing,
                        child: Text(
                          "Select Your Gender with Respect and Inclusivity.",
                          style: apptheme.labelText,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Visibility(
                        visible: enableEditing,
                        child: Row(
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
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: enableEditing,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Transform Your Body: Lose or Gain, Embrace the Change!",
                              style: apptheme.labelText,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Visibility(
                        visible: enableEditing,
                        child: Row(
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
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      Visibility(
                          visible: enableEditing,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      apptheme.secondaryColor),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7)))),
                              onPressed: () {
                                ProfileModel newUserprofile = ProfileModel(
                                    displayName: displaynameController.text,
                                    age: int.tryParse(ageController.text) ?? 0,
                                    weight: double.tryParse(
                                            weightController.text) ??
                                        0,
                                    height: double.tryParse(
                                            heightController.text) ??
                                        0,
                                    gender: _genderEnum.toString(),
                                    goal: _goalEnum.toString(),
                                    enrollDatetime:
                                        DateTime.now().millisecondsSinceEpoch);

                                profiles.put(
                                    newUserprofile.displayName, newUserprofile);
                                clearcntrls();
                                enableEditing = false;
                                setState(() {
                                  // Trigger a rebuild
                                });
                              },
                              child: Text(
                                "Save Changes",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ))),

                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
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
  
  void clearcntrls() {
    displaynameController.clear();
    ageController.clear();
    weightController.clear();
    heightController.clear();
  }
}
