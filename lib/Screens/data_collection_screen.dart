import 'package:flutter/material.dart';
import 'package:workout_tracker/screens/data_collection_widgets/gender_radio_tile.dart';
import 'package:workout_tracker/screens/data_collection_widgets/get_started-button.dart';
import 'package:workout_tracker/screens/data_collection_widgets/goals_container.dart';
import 'package:workout_tracker/screens/data_collection_widgets/textfields.dart';
import 'package:workout_tracker/screens/data_collection_widgets/top_icon_text.dart';

class DataCollectionScreen extends StatefulWidget {
  DataCollectionScreen({super.key});

  @override
  State<DataCollectionScreen> createState() => _DataCollectionScreenState();
}

// Radio button
List<String> genders = ['Male', 'Female', 'Other'];

class _DataCollectionScreenState extends State<DataCollectionScreen> {
  // Text Editing Controllers
  final displaynameController = TextEditingController();
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  // Radio button
  String selectedGender = genders[0];

  // Selection bool
  bool WeightLossSelected = false;
  bool WeightGainSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                    child: Textfields(
                        controller: displaynameController,
                        hintText: "Display Name")),
                Flexible(
                    child:
                        Textfields(controller: ageController, hintText: "Age")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                    child: Textfields(
                        controller: weightController,
                        hintText: "Weight (in kgs)")),
                Flexible(
                    child: Textfields(
                        controller: heightController,
                        hintText: "Height (in cms)")),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            //Text("Select your gender", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),),
            GenderRadioTile(genders: genders, selectedGender: selectedGender),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "What is your goal ?",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            Goals(
                WeightLossSelected: WeightLossSelected,
                WeightGainSelected: WeightGainSelected),
            SizedBox(
              height: 60,
            ),

            GetStartedButton(),
          ],
        ),
      ),
    );
  }
}
