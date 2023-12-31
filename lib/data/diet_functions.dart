
// import 'package:workout_tracker/models/food.dart';
// import 'package:workout_tracker/models/meals.dart';


// class DietDetails {
//   List<Meals> mealsList = [
//     Meals(name: "Breakfast", food: [
//       Food(foodName: "Chicken Breast", protein: "31", calorie: "165")
//     ]),
//     Meals(
//         name: "Lunch",
//         food: [Food(foodName: "Egg Rice", protein: "37", calorie: "157")]),
//     Meals(name: "Dinner", food: [
//       Food(foodName: "Paneer Sandwich", protein: "40", calorie: "100")
//     ])
//   ];

//   // Get number of food items in a Meal
//   int numberofFoodItemsInMeal(String mealName) {
//     Meals relevantMeal = getRelevantMeal(mealName);

//     return relevantMeal.food.length; // Returns count/length of food list
//   }

//   // Get Meals List
//   List<Meals> getMealsList() {
//     return mealsList;
//   }

//   /* 
  
//   We don't have to add new meal because there is nothing more than 
//   BREAKFAST , LUNCH , DINNER 
  
//   */

//   // But we can add a new Food item

//   void addFoddItem(
//       String mealName, String foodName, String protein, String calorie) {
//     // We have to find out the relevant Meal

//     Meals relevantMeal = getRelevantMeal(mealName);

//     // Once we find the relevant meal , we can add the food item to it

//     relevantMeal.food
//         .add(Food(foodName: foodName, protein: protein, calorie: calorie));

//     // save the newly added foods to the database here

//     // Maybe do hive operations here? so that when you add it,it gets saved ?
//   }

//   // get relevant Meal
//   Meals getRelevantMeal(String mealName) {
//     Meals relevantMeal = mealsList.firstWhere((meal) => meal.name == mealName);

//     return relevantMeal;
//   }

//   // get relevant Food item given Food item name + Meal name

//   Food getRelevantFooditem(String mealName, String foodName) {
//     Meals relevantMeal = getRelevantMeal(mealName);

//     // Finding relevant food item
//     Food relevantFoodItem = relevantMeal.food
//         .firstWhere((fooditem) => fooditem.foodName == foodName);

//     return relevantFoodItem;
//   }

//   /* CONFIGURE THE DATABASE HERE */

// // Open Hive box

  
// }