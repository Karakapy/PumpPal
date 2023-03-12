import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorWidget extends StatefulWidget {
  String type;
  double fuelPrice = 0.0;
  double fuelCapacity = 0.0;
  double fuelConsumption = 0.0;
  //Budget parameter
  double budget = 0.0;
  //Tank parameter
  double current = 0.0;
  double desired = 0.0;
  //Distance parameter
  double distance = 0.0;

  CalculatorWidget({
    required this.type,
    required this.fuelConsumption,
    required this.fuelPrice});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  @override
  Widget build(BuildContext context) {

    return const MaterialApp();
  }
}
