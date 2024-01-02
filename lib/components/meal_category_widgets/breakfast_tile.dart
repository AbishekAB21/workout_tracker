import 'package:flutter/material.dart';
import 'package:workout_tracker/components/meal_category_widgets/text_field_meals.dart';
import 'package:workout_tracker/data/diet_database_helper.dart';
import 'package:workout_tracker/models/breakfast.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class BreakfastTile extends StatefulWidget {
  @override
  State<BreakfastTile> createState() => _BreakfastTileState();
}

class _BreakfastTileState extends State<BreakfastTile> {
// text editing controllers

  final TextEditingController breakfastNameController = TextEditingController();
  final TextEditingController proteinController = TextEditingController();
  final TextEditingController calorieController = TextEditingController();
  final TextEditingController servingsController = TextEditingController();

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
                title: Text(
                  "Add Breakfast Item",
                  style: apptheme.titleText,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MealsTextFields(
                        Controller: breakfastNameController,
                        hinttext: "What did you have for breakfast ?",
                        label: "What did you have for breakfast ?"),
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
                    MealsTextFields(
                        Controller: servingsController,
                        hinttext: "Enter number of servings",
                        label: "Enter number of servings"),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        final breakfastFood = Breakfast(
                          foodName: breakfastNameController.text,
                          protein: int.tryParse(proteinController.text) ?? 0,
                          calorie: int.tryParse(calorieController.text) ?? 0,
                          servings: int.tryParse(servingsController.text) ?? 0,
                        );

                        BreakfastDatabseHelper.addBreakfastFood(breakfastFood);

                        setState(() {
                          // Trigger a rebuild to update the food list
                        });
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Add",
                        style: apptheme.buttonTextColor,
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
        body: _buildfoodList());
  }

  ListView _buildfoodList() {
    final Breakfastfoodlist = BreakfastDatabseHelper.getAllBreakfastFood();

    return ListView.separated(
        itemBuilder: (context, index) {
          final breakfastfood = Breakfastfoodlist[index];
          return ListTile(
            title: Text(
              breakfastfood.foodName,
              style: apptheme.titleText,
            ),
            subtitle: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Protein : " + breakfastfood.protein.toString(),
                  style: apptheme.labelText,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Calorie : " + breakfastfood.calorie.toString(),
                  style: apptheme.labelText,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Servings : " + breakfastfood.servings.toString(),
                  style: apptheme.labelText,
                ),
                SizedBox(
                  width: 4,
                ),
              ],
            ),
            leading: Icon(
              Icons.fastfood_rounded,
              color: apptheme.foregroundColor,
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
        itemCount: Breakfastfoodlist.length);
  }
}
