import 'package:flutter/material.dart';
import 'package:workout_tracker/data/hive_database.dart';
import 'package:workout_tracker/models/diet.dart';

class DietData extends ChangeNotifier{
final dietDatabase = HiveDatabase();

//Download method
final diet_file_path = HiveDatabase();

List <CutDiet> cutDietTips = [];
List <BulkDiet> bulkDietTips = [];

String CuttingPlan = "";
String BulkingPlan = "";

// Check if previous data exists in the list. if yes then use readfromdatabase()
// Else save the empty list into the database 
// first make a function called previousDataExists in Hive for diet CUT and BULK


  // Check if previous data exists in the list. If yes, use readFromDatabase().
  // Else, save the empty list into the database.
  Future<void> initializeCutList() async {
    if (await dietDatabase.previousCutDietData()) {
      cutDietTips = dietDatabase.readFromDietDatabase();
    } else {
      dietDatabase.saveCuttingdiet(cutDietTips);
    }
  }


 // Add Cutting tips
  void addCutTip(String tip1, String tip2, String tip3, String tip4, String tip5) {
    cutDietTips.add(CutDiet(
      CutTip1: tip1,
      CutTip2: tip2,
      CutTip3: tip3,
      CutTip4: tip4,
      CutTip5: tip5,
    ));
   // notifyListeners();
    
    dietDatabase.saveCuttingdiet(cutDietTips);
  }

  // Add Bulking tips
  void addBulkingTips(String tip1, String tip2, String tip3, String tip4, String tip5) {
    bulkDietTips.add(BulkDiet(
      BulkTip1: tip1,
      BulkTip2: tip2,
      BulkTip3: tip3,
      BulkTip4: tip4,
      BulkTip5: tip5,
    ));
    // notifyListeners();

    // dietDatabase.saveBulkingPlan(bulkDietTips);
  }



// ------ Download Method ------
void addCutPlanPath(String CuttingPlanFilePath){
 
 CutFile(cutFilePath: CuttingPlanFilePath);

 // Save to databse 
 diet_file_path.saveFilePath(CuttingPlanFilePath);
 CuttingPlan = CuttingPlanFilePath;
}

void addBulkPlanPath(String BulkingPlanFilePath){
  BulkFile(bulkFilePath: BulkingPlanFilePath);

  // Save to database
  diet_file_path.saveFilePath(BulkingPlanFilePath);
  BulkingPlan = BulkingPlanFilePath;
}
}