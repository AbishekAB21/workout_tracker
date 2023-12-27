import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CurvedNavBar extends StatefulWidget {
  const CurvedNavBar({super.key});

  @override
  State<CurvedNavBar> createState() => _CurvedNavBarState();
}

class _CurvedNavBarState extends State<CurvedNavBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 70,
      onTap: (index) {
        
      },
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.deepPurple,
      color: Colors.deepPurpleAccent.shade200, 
      items: [
        Icon(Icons.home, color: Colors.white,),
        Icon(Icons.history, color: Colors.white,),
        Icon(Icons.shopping_cart_rounded, color: Colors.white,)
      ]);
  }
}