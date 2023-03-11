import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../constantPreset.dart';


class NavBarWidget extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  NavBarWidget({required this.currentIndex, required this.onTap});

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<NavBarWidget> {
  List<IconData> iconList = [
    Icons.home_outlined,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: iconList,
      iconSize: 35,
      activeIndex: widget.currentIndex,
      activeColor: blackColor,
      inactiveColor: greyColor,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.smoothEdge,
      onTap: widget.onTap,
    );
  }
}
