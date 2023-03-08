import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {

  static const String logoPath = "lib/assets/logo/pumppal_logo.png";
  double height;
  double width;

  LogoWidget({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      logoPath,
      height: height,
      width: width,
    );
  }
}