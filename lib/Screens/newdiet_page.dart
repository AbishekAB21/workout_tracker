import 'package:flutter/material.dart';
import 'package:workout_tracker/components/meal_category_tile.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class DietPlannerPage extends StatefulWidget {
  DietPlannerPage({
    super.key,
  });

  @override
  State<DietPlannerPage> createState() => _DietPlannerPageState();
}

class _DietPlannerPageState extends State<DietPlannerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apptheme.primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white70),
        backgroundColor: apptheme.primaryColor,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Icon(Icons.fastfood_rounded,
              size: 50, color: apptheme.foregroundColor),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("A healthy diet goes a long way in staying fit.",
                  style: apptheme.titleText),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              String mealName;
              switch (index) {
                case 0:
                  mealName = "Breakfast";
                  break;
                case 1:
                  mealName = "Lunch";
                  break;
                case 2:
                  mealName = "Dinner";
                  break;
                default:
                  mealName = "";
              }
              return MealCategoryTile(mealName: mealName);
            },
            separatorBuilder: (context, index) => SizedBox(height: 20,), 
            itemCount: 3,
          ),
        ],
      ),
    );
  }
}