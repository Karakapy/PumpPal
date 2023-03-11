import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';import 'package:flutter/material.dart';
import 'package:pumppal/screens/fuel_calculator_screen.dart';
import 'package:pumppal/constantPreset.dart';

class BottomBarWidget extends StatefulWidget {

  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  List<IconData> iconList = [ //list of icons that required by animated navigation bar.
    Icons.abc_sharp,
    Icons.access_time,
    Icons.holiday_village,
    Icons.account_tree_rounded
  ];

  int _bottomNavIndex = 0;

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(

          child: Icon(Icons.home_max_outlined),
          onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar( //navigation bar
        icons: iconList, //list of icons
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        backgroundColor: Colors.blue,

      ),
    );
  }
}
