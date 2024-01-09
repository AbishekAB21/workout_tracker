import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
          return Slidable(
            startActionPane: ActionPane(motion: StretchMotion(), children: [
              SlidableAction(
                onPressed: (context) {
                  // Edit
                },
                backgroundColor: Colors.yellow.shade700,
                icon: Icons.edit,
                foregroundColor: Colors.white,
              )
            ]),
            endActionPane: ActionPane(motion: StretchMotion(), children: [
              SlidableAction(
                onPressed: (context) {
                  // Delete
                },
                backgroundColor: Colors.red,
                icon: Icons.delete_rounded,
                foregroundColor: Colors.white,
              )
            ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                tileColor: apptheme.secondaryColor,
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
                leading: Container(
                  height: 35,
                  width: 35,
                  child: Image.asset("assets/lunch.png"),
                ),
              ),
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
