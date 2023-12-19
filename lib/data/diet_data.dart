import 'package:flutter/material.dart';
import 'package:workout_tracker/data/hive_database.dart';
import 'package:workout_tracker/models/diet.dart';

class DietData extends ChangeNotifier{
final diet_database = HiveDatabase();

List <CutDiet> CutDietTips = [];
List <BulkDiet> BulkDietTips = [];

// Check if previous data exists in the list. if yes then use readfromdatabase()
// Else save the empty list into the database 
// first make a function called previousDataExists in Hive for diet CUT and BULK

// Cutting 
 void initializeCutList(){
  // if previousDataExists() returns true
  if(diet_database.previousCutDietData() == true){
    CutDietTips = diet_database.readFromDietDatabase();
  } 
  // if previousDataExists() returns false
  else{
    diet_database.saveCuttingdiet(CutDietTips);
  }
 }

// Add Cutting tips
addCutTip(String tip1, String tip2, String tip3, String tip4, String tip5){
  CutDietTips.add(CutDiet( 
    CutTip1: tip1, 
    CutTip2: tip2, 
    CutTip3: tip3, 
    CutTip4: tip4, 
    CutTip5: tip5,
  ));
  notifyListeners();

 diet_database.saveCuttingdiet(CutDietTips);
}

// Add Bulking tips
addBulkingTips(String tip1, String tip2, String tip3, String tip4, String tip5){
  BulkDietTips.add(BulkDiet( BulkTip1: tip1, 
    BulkTip2: tip2, 
    BulkTip3: tip3, 
    BulkTip4: tip4, 
    BulkTip5: tip5,
  ));
  notifyListeners();

  // diet_database.saveBulkingPlan(BulkDietTips);
}
}