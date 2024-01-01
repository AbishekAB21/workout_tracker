import 'package:flutter/material.dart';
import 'package:workout_tracker/components/meal_category_widgets/text_field_meals.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class DinnerTile extends StatefulWidget {
  @override
  State<DinnerTile> createState() => _DinnerTileState();
}

class _DinnerTileState extends State<DinnerTile> {
  // Text Editing Controllers
  final TextEditingController dinnerController = TextEditingController();
  final TextEditingController proteinController = TextEditingController();
  final TextEditingController calorieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apptheme.primaryColor,
      appBar: AppBar(
        backgroundColor: apptheme.primaryColor,
        iconTheme: IconThemeData(color: apptheme.foregroundColor),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: apptheme.secondaryColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: apptheme.primaryColor,
              title: Text("Add Dinner Item", style: apptheme.titleText,),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MealsTextFields(
                      Controller: dinnerController,
                      hinttext: "What did you have for dinner ?",
                      label: "What did you have for dinner ?"),
                  SizedBox(
                    height: 6,
                  ),
                  MealsTextFields(
                      Controller: proteinController,
                      hinttext: "Enter protein content",
                      label: "Enter protein content"),
                  SizedBox(
                    height: 6,
                  ),
                  MealsTextFields(
                      Controller: calorieController,
                      hinttext: "Enter calorie content",
                      label: "Enter calorie content"),
                  SizedBox(
                    height: 6,
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Add",
                      style: apptheme.buttonTextColor,
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Cancel",
                      style: apptheme.buttonTextColor,
                    ))
              ],
            ),
          );
        },
        child: Icon(
          Icons.add_rounded,
          color: apptheme.foregroundColor,
        ),
      ),
      body: Center(
        child: Text('Content for Dinner Screen'),
      ),
    );
  }
}
