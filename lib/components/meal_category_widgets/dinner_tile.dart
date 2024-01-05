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

  final TextEditingController newFoodNameController = TextEditingController();
  final TextEditingController NewProteinController = TextEditingController();
  final TextEditingController NewCalorieController = TextEditingController();
  final TextEditingController NewServingsController = TextEditingController();

  @override
  void dispose() {
    dinnerController.dispose();
    proteinController.dispose();
    calorieController.dispose();
    servingsController.dispose();
    newFoodNameController.dispose();
    NewProteinController.dispose();
    NewCalorieController.dispose();
    NewServingsController.dispose();
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
                        clearCntrl();
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
            tileColor: apptheme.secondaryColor,
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
            leading: 
            // Icon(
            //   Icons.fastfood_rounded,
            //   color: apptheme.foregroundColor,
            // ),
            Container(
              height: 35,
              width: 35,
              child: Image.asset("assets/dinner.png"),
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
                                    DinnerDatabseHelper.DeleteDinnerItems(
                                        index);
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
                          title: Text("Edit existing food details ?", style: apptheme.titleText,),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MealsTextFields(
                                  Controller: newFoodNameController,
                                  hinttext: "What did you have for dinner ?",
                                  label: "What did you have for dinner ?"),
                              SizedBox(
                                height: 6,
                              ),
                              MealsTextFields(
                                  Controller: NewProteinController,
                                  hinttext: "Enter protein content",
                                  label: "Enter protein content"),
                              SizedBox(
                                height: 6,
                              ),
                              MealsTextFields(
                                  Controller: NewCalorieController,
                                  hinttext: "Enter calorie content",
                                  label: "Enter calorie content"),
                              SizedBox(
                                height: 6,
                              ),
                              MealsTextFields(
                                  Controller: NewServingsController,
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
                                      foodName: newFoodNameController.text,
                                      protein: int.tryParse(
                                              NewProteinController.text) ??
                                          0,
                                      calorie: int.tryParse(
                                              NewCalorieController.text) ??
                                          0,
                                      servings: int.tryParse(
                                              NewServingsController.text) ??
                                          0);
                                  setState(() {
                                    DinnerDatabseHelper.UpdateDinnerItems(
                                        index, dinnerFood);
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
              height: 6,
            ),
        itemCount: dinnerFoodList.length);
  }
  
  void clearCntrl() {
    dinnerController.clear();
    proteinController.clear();
    calorieController.clear();
    servingsController.clear();
    newFoodNameController.clear();
    NewProteinController.clear();
    NewCalorieController.clear();
    NewServingsController.clear();
  }
}
