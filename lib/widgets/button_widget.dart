import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {

  Widget theChild;
  VoidCallback? theOnTapFunc;
  Color color;

  ButtonWidget({ required this.theChild, this.theOnTapFunc, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: theOnTapFunc,
      child: Container(
        child: theChild,
        // margin: const EdgeInsets.all(0.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15.0),
        ),


      ),
    );
  }
}