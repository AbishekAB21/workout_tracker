import 'package:flutter/material.dart';
import 'package:workout_tracker/components/meal_category_widgets/text_field_meals.dart';
import 'package:workout_tracker/data/diet_database_helper.dart';
import 'package:workout_tracker/models/dinner.dart';
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
                  "Add Dinner Item",
                  style: apptheme.titleText,
                ),
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
                    MealsTextFields(
                        Controller: servingsController,
                        hinttext: "Enter number of servings",
                        label: "Enter number of servings"),
                    SizedBox(
                      height: 6,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        final dinnerFood = Dinner(
                            foodName: dinnerController.text,
                            protein: int.tryParse(proteinController.text) ?? 0,
                            calorie: int.tryParse(calorieController.text) ?? 0,
                            servings:
                                int.tryParse(servingsController.text) ?? 0);

                        DinnerDatabseHelper.addDinnerFood(dinnerFood);

                        setState(() {
                          // Trigger a rebuild
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
        body: _buildFoodList());
  }

  ListView _buildFoodList() {
    final dinnerFoodList = DinnerDatabseHelper.getAllDinnerFood();

    return ListView.separated(
        itemBuilder: (context, index) {
          final dinnerFood = dinnerFoodList[index];
          return ListTile(
            title: Text(
              dinnerFood.foodName,
              style: apptheme.titleText,
            ),
            subtitle: Row(
              children: [
                Text(
                  "Protein : " + dinnerFood.protein.toString(),
                  style: apptheme.labelText,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Calorie : " + dinnerFood.calorie.toString(),
                  style: apptheme.labelText,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Servings : " + dinnerFood.servings.toString(),
                  style: apptheme.labelText,
                ),
                SizedBox(
                  width: 4,
                ),
              ],
            ),
            trailing: Icon(Icons.fastfood_rounded),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
              height: 6,
            ),
        itemCount: dinnerFoodList.length);
  }
}
