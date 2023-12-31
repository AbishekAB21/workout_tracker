import 'package:flutter/material.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class BreakfastTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apptheme.primaryColor,
       appBar: AppBar(
        backgroundColor: apptheme.primaryColor,
        iconTheme: IconThemeData(color: apptheme.foregroundColor),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: apptheme.secondaryColor,
        onPressed: () {},
        child: Icon(Icons.add_rounded, color: apptheme.foregroundColor,),
      ),
      body: Center(
        child: Text('Content for Breakfast Screen'),
      ),
    );
  }
}