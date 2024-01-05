import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:workout_tracker/utils/app_theme.dart';

class CurvedNavBar extends StatefulWidget {
  const CurvedNavBar({super.key});

  @override
  State<CurvedNavBar> createState() => _CurvedNavBarState();
}

class _CurvedNavBarState extends State<CurvedNavBar> {

  final items =  [
    // Icon(Icons.home, color: Colors.white,),
    Container(
      height: 35,
      width: 35,
      child: Image.asset("assets/home.png")),
    Container(
      height: 35,
      width: 35,
      child: Image.asset("assets/weightlifting.png")),
    Container(
      height: 35,
      width: 35,
      child: Image.asset("assets/diet.png")),
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