

import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_tracker/models/breakfast.dart';
import 'package:workout_tracker/models/dinner.dart';
import 'package:workout_tracker/models/lunch.dart';


// ------------------- Breakfast -------------------

class BreakfastDatabseHelper{
  static const String boxName = 'breakfastBox';

  static Future<void> addBreakfastFood(Breakfast breakfastFood) async{
    
    final box = await Hive.openBox<Breakfast>(boxName);
    await box.add(breakfastFood);
  }

  static List<Breakfast> getAllBreakfastFood() {
    final box = Hive.box<Breakfast>(boxName);
    
    return box.values.toList();
  }
}

// ------------------- Lunch -------------------

class LunchDatabseHelper{
  static const String lunchbox = 'lunchBox';

  static Future<void> addLunchFood(Lunch lunchFood) async{
   
   final lbox = await Hive.openBox<Lunch>(lunchbox);
   await lbox.add(lunchFood);
  }

  static List<Lunch> getAllLunchFood(){
    final lbox = Hive.box<Lunch>(lunchbox);

    return lbox.values.toList();
  }
}

// ------------------- Dinner -------------------

class DinnerDatabseHelper{
  static const String dinnerbox = "dinnerbox";

  static Future<void> addDinnerFood(Dinner dinnerFood) async{
   
   final dbox = await Hive.openBox<Dinner>(dinnerbox);
   await dbox.add(dinnerFood);
  }

  static List<Dinner> getAllDinnerFood(){
    final dbox = Hive.box<Dinner>(dinnerbox);

    return dbox.values.toList();
  }
}