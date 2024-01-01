import 'package:flutter/material.dart';
import 'package:workout_tracker/components/meal_category_widgets/breakfast_tile.dart';
import 'package:workout_tracker/components/meal_category_widgets/dinner_tile.dart';
import 'package:workout_tracker/components/meal_category_widgets/lunch_tile.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class MealCategoryTile extends StatelessWidget {
  final String mealName;

  MealCategoryTile({required this.mealName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: ListTile(
          tileColor: apptheme.secondaryColor,
          textColor: apptheme.foregroundColor,
          iconColor: apptheme.foregroundColor,
          contentPadding: EdgeInsets.all(15),
          title: Text(
            mealName,
            style: apptheme.titleText,
          ),
          leading: Icon(
            Icons.fastfood,
            color: apptheme.foregroundColor,
            size: 35,
          ),
          trailing: Icon(
            Icons.navigate_next_rounded,
            color: apptheme.foregroundColor,
          ),
          onTap: () {
            switch (mealName) {
              case 'Breakfast':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BreakfastTile(),
                  ),
                );
                break;
              case 'Lunch':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LunchTile(),
                  ),
                );
                break;
              case 'Dinner':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DinnerTile(),
                  ),
                );
                break;
              default:
                // Handle other cases or do nothing
                break;
            }
            ;
          }),
    );
  }
}
