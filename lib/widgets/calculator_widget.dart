import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constantPreset.dart';

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
    required this.fuelPrice,
    required this.fuelCapacity});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case "Tank":
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: lightGreyColor,
            borderRadius: BorderRadius.circular(12),),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                calculatorTextGenerator(),
                Container(
                  padding: EdgeInsets.only(bottom: 15),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Current amount", style: calculateFont),
                      Text("${widget.current}", style: calculateFont),
                      Text("L", style: calculateFont),
                    ],),
                ),
              ],
            ),
          ),
        );
      case "Distance":
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: lightGreyColor,
            borderRadius: BorderRadius.circular(12),),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                  children: [
                  calculatorTextGenerator(),
              ]
            )
        )
        );
      default:
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: lightGreyColor,
            borderRadius: BorderRadius.circular(12),),
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                    children: [
                      calculatorTextGenerator(),
                    ]
                )
            )
        );
    }
  }

  Widget calculatorTextGenerator() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 15),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Fuel Capacity", style: calculateFont),
              Text("${widget.fuelCapacity}", style: calculateFont),
              Text("L", style: calculateFont),
            ],),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 15),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Fuel Consumption", style: calculateFont),
              Text("${widget.fuelConsumption}", style: calculateFont),
              Text("km/L", style: calculateFont),
            ],),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 15),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Fuel Price", style: calculateFont),
              Text("${widget.fuelPrice}", style: calculateFont),
              Text("Baht/L", style: calculateFont),
            ],),
        ),
      ],
    );
  }
}
