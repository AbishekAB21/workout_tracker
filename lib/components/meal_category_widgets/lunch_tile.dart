import 'package:flutter/material.dart';
import 'package:workout_tracker/components/meal_category_widgets/text_field_meals.dart';
import 'package:workout_tracker/data/diet_database_helper.dart';
import 'package:workout_tracker/models/lunch.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class LunchTile extends StatefulWidget {
  @override
  State<LunchTile> createState() => _LunchTileState();
}

class _LunchTileState extends State<LunchTile> {
  // Text Editing Controllers
  final TextEditingController lunchController = TextEditingController();
  final TextEditingController proteinController = TextEditingController();
  final TextEditingController calorieController = TextEditingController();
  final TextEditingController servingsController = TextEditingController();

  final TextEditingController newFoodNameController = TextEditingController();
  final TextEditingController newProteinController = TextEditingController();
  final TextEditingController newCalorieController = TextEditingController();
  final TextEditingController newServingsController = TextEditingController();

  @override
  void dispose() {

    lunchController.dispose();
    proteinController.dispose();
    calorieController.dispose();
    servingsController.dispose();
    newFoodNameController.dispose();
    newProteinController.dispose();
    newCalorieController.dispose();
    newServingsController.dispose();
    super.dispose();
  }

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
                  "Add Lunch Item",
                  style: apptheme.titleText,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MealsTextFields(
                        Controller: lunchController,
                        hinttext: "What did you have for lunch ?",
                        label: "What did you have for lunch ?"),
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
                        final lunchFood = Lunch(
                            foodName: lunchController.text,
                            protein: int.tryParse(proteinController.text) ?? 0,
                            calorie: int.tryParse(calorieController.text) ?? 0,
                            servings:
                                int.tryParse(servingsController.text) ?? 0);

                        LunchDatabseHelper.addLunchFood(lunchFood);

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
    final lunchFoodList = LunchDatabseHelper.getAllLunchFood();

    return ListView.separated(
        itemBuilder: (context, index) {
          final lunchFood = lunchFoodList[index];
          return ListTile(
            title: Text(
              lunchFood.foodName,
              style: apptheme.titleText,
            ),
            subtitle: Row(
              children: [
                Text(
                  "Protein : " + lunchFood.protein.toString(),
                  style: apptheme.labelText,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Calorie : " + lunchFood.calorie.toString(),
                  style: apptheme.labelText,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Servings : " + lunchFood.servings.toString(),
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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: apptheme.primaryColor,
                          title: Text(
                            "Delete food item ?",
                            style: apptheme.titleText,
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    LunchDatabseHelper.DeleteLunchItems(index);
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Yes",
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
                    icon: Icon(
                      Icons.delete_rounded,
                      color: apptheme.foregroundColor,
                    )),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: apptheme.primaryColor,
                          title: Text(
                            "Edit existing food details ?",
                            style: apptheme.titleText,
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MealsTextFields(
                                  Controller: newFoodNameController,
                                  hinttext: "What did you have for lunch ?",
                                  label: "What did you have for lunch ?"),
                              SizedBox(
                                height: 6,
                              ),
                              MealsTextFields(
                                  Controller: newProteinController,
                                  hinttext: "Enter protein content",
                                  label: "Enter protein content"),
                              SizedBox(
                                height: 6,
                              ),
                              MealsTextFields(
                                  Controller: newCalorieController,
                                  hinttext: "Enter calorie content",
                                  label: "Enter calorie content"),
                              SizedBox(
                                height: 6,
                              ),
                              MealsTextFields(
                                  Controller: newServingsController,
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
                                  final lunchFood = Lunch(
                                      foodName: newFoodNameController.text,
                                      protein: int.tryParse(
                                              newProteinController.text) ??
                                          0,
                                      calorie: int.tryParse(
                                              newCalorieController.text) ??
                                          0,
                                      servings: int.tryParse(
                                              newServingsController.text) ??
                                          0);
                                  setState(() {
                                    LunchDatabseHelper.UpdateLunchItems(
                                        index, lunchFood);
                                  });
                                  clearCntrl();
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Update",
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
                    icon: Icon(
                      Icons.edit_rounded,
                      color: apptheme.foregroundColor,
                    ))
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
        itemCount: lunchFoodList.length);
  }

  void clearCntrl() {
    lunchController.clear();
    proteinController.clear();
    calorieController.clear();
    servingsController.clear();
    newFoodNameController.clear();
    newProteinController.clear();
    newCalorieController.clear();
    newServingsController.clear();
  }
}
