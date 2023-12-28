import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/screens/splash_screen.dart';
import 'package:workout_tracker/data/workout_data.dart';

void main() async{
  //Downloading Method
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase
  // await Firebase.initializeApp();

  // Plugin must be initialized before using
  // await FlutterDownloader.initialize(
  //   debug: true, // optional: set to false to disable printing logs to console (default: true)
  //   ignoreSsl: true // option: set to false to disable working with http links (default: false)
  // );
  
  // Initialize Hive 
     await Hive.initFlutter();

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