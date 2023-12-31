import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/data/diet_database_helper.dart';
import 'package:workout_tracker/models/breakfast.dart';
import 'package:workout_tracker/models/dinner.dart';
import 'package:workout_tracker/models/exercise.dart';
import 'package:workout_tracker/models/lunch.dart';
import 'package:workout_tracker/models/profile_model.dart';
import 'package:workout_tracker/models/water.dart';
import 'package:workout_tracker/models/workouts.dart';
import 'package:workout_tracker/screens/splash_screen.dart';
import 'package:workout_tracker/data/workout_data.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();  
  // Initialize Hive 
    await Hive.initFlutter();
     
    await Hive.openBox<Breakfast>('breakfastBox');
    await Hive.openBox<Lunch>('lunchBox');
    await Hive.openBox<Dinner>('dinnerbox');
    await Hive.openBox<Water>('waterbox');
     
     Hive.registerAdapter(ProfileModelAdapter());
     Hive.registerAdapter(BreakfastAdapter());
     Hive.registerAdapter(LunchAdapter());
     Hive.registerAdapter(DinnerAdapter());
     Hive.registerAdapter(WorkoutAdapter());
     Hive.registerAdapter(ExerciseAdapter());
     Hive.registerAdapter(WaterAdapter());

  // Adding default values 
     BreakfastDatabseHelper.addDefaultBreakfastData();
     LunchDatabseHelper.addDefaultLunchData();
     DinnerDatabseHelper.addDefaultDinnerData();  
     

  // Open Hive Box
     await Hive.openBox("workout_database"); 
     await Hive.openBox("diet_database");
     await Hive.openBox("path_database");
     
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkoutData(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}