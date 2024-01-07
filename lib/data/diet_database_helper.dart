import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_tracker/models/breakfast.dart';
import 'package:workout_tracker/models/dinner.dart';
import 'package:workout_tracker/models/lunch.dart';

// ------------------- Breakfast -------------------

class BreakfastDatabseHelper {
  static const String boxName = 'breakfastBox';

  static Future<void> addDefaultBreakfastData() async {
    final box = await Hive.openBox<Breakfast>(boxName);

    // Adding default Breakfast items here
    final defaultBreakfast1 =
        Breakfast(foodName: "Chicken", protein: 30, calorie: 100, servings: 1);
    final defaultBreakfast2 =
        Breakfast(foodName: 'Eggs', protein: 30, calorie: 80, servings: 3);

    await box.addAll([defaultBreakfast1, defaultBreakfast2]);
  }

  static Future<void> addBreakfastFood(Breakfast breakfastFood) async {
    final box = await Hive.openBox<Breakfast>(boxName);
    await box.add(breakfastFood);
  }

  static List<Breakfast> getAllBreakfastFood() {
    final box = Hive.box<Breakfast>(boxName);

    return box.values.toList();
  }

  static Future<void> DeleteBreakfastItems(int index) async {
    final b_box = Hive.box<Breakfast>(boxName);
    await b_box.deleteAt(index);
  }

  static Future<void> UpdateBreakfastItems(
      int index, Breakfast newBreakfastFood) async {
    final b_box = Hive.box<Breakfast>(boxName);
    await b_box.putAt(index, newBreakfastFood);
  }
}

// ------------------- Lunch -------------------

class LunchDatabseHelper {
  static const String lunchbox = 'lunchBox';

  static Future<void> addLunchFood(Lunch lunchFood) async {
    final lbox = await Hive.openBox<Lunch>(lunchbox);
    await lbox.add(lunchFood);
  }

  static List<Lunch> getAllLunchFood() {
    final lbox = Hive.box<Lunch>(lunchbox);

    return lbox.values.toList();
  }

  static Future<void> DeleteLunchItems(int index) async {
    final lbox = await Hive.box<Lunch>(lunchbox);
    await lbox.deleteAt(index);
  }

  static Future<void> UpdateLunchItems(int index, Lunch lunchfood) async {
    final lbox = await Hive.box<Lunch>(lunchbox);
    await lbox.putAt(index, lunchfood);
  }
}

// ------------------- Dinner -------------------

class DinnerDatabseHelper {
  static const String dinnerbox = 'dinnerbox';

  static Future<void> addDinnerFood(Dinner dinnerFood) async {
    final dbox = await Hive.openBox<Dinner>(dinnerbox);
    await dbox.add(dinnerFood);
  }

  static List<Dinner> getAllDinnerFood() {
    final dbox = Hive.box<Dinner>(dinnerbox);

    return dbox.values.toList();
  }

  static Future<void> DeleteDinnerItems(int index) async {
    final dbox = await Hive.openBox<Dinner>(dinnerbox);
    await dbox.deleteAt(index);
  }

  static Future<void> UpdateDinnerItems(int index, Dinner NewdinnerFood) async {
    final dbox = await Hive.openBox<Dinner>(dinnerbox);
    await dbox.putAt(index, NewdinnerFood);
  }
}
