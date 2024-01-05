import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class CurvedNavBar extends StatefulWidget {
  const CurvedNavBar({super.key});

  @override
  State<CurvedNavBar> createState() => _CurvedNavBarState();
}

class _CurvedNavBarState extends State<CurvedNavBar> {

  final items = const [
    Icon(Icons.home, color: Colors.white,),
    Icon(Icons.sports_gymnastics_rounded, color: Colors.white,),
    Icon(Icons.fastfood_rounded, color: Colors.white,)
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 70,
      
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: apptheme.primaryColor,
      color: apptheme.secondaryColor, 
      items: items,
      index: index,
      onTap: (selectedindex) {
        setState(() {
           index = selectedindex ;
        });

      },
      );
  }
}