import 'package:flutter/material.dart';
import 'package:pumppal/constantPreset.dart';

class ButtonWidget extends StatelessWidget {

  Widget theChild;
  VoidCallback? theOnTapFunc;

  ButtonWidget({ required this.theChild, this.theOnTapFunc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: theOnTapFunc,
      child: Container(
        child: theChild,
        // margin: const EdgeInsets.all(0.0),
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(15.0),
        ),


      ),
    );
  }
}