import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/Screens/splash_screen.dart';
import 'package:workout_tracker/data/workout_data.dart';

void main() async{
  // Initialize Hive 
     await Hive.initFlutter();

  // Open Hive Box
     await Hive.openBox("workout_database"); 
     await Hive.openBox("diet_database");
     
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