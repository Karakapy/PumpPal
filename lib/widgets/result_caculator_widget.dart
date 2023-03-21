import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constantPreset.dart';
import '../models/car_model.dart';
import '../screens/result_screen.dart';
import 'button_widget.dart';

class ResultCalculatorWidget extends StatefulWidget {
  CarModel? car;
  String? type;
  String? fuelType;
  String? gasStation;
  int selectedGasStationIndex;
  double fuelConsumption;
  double fuelPrice;
  double fuelCapacity;
  double budget;
  int current_amount;
  int final_amount;
  double distance;

  ResultCalculatorWidget({
    required this.car,
    required this.type,
    required this.fuelType,
    required this.gasStation,
    required this.selectedGasStationIndex,
    required this.fuelConsumption,
    required this.fuelPrice,
    required this.fuelCapacity,
    required this.budget,
    required this.current_amount,
    required this.final_amount,
    required this.distance,
  });

  @override
  State<ResultCalculatorWidget> createState() => _ResultCalculatorWidgetState();
}

class _ResultCalculatorWidgetState extends State<ResultCalculatorWidget> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    switch (widget.type) {
    //Tank calculator
      case "Tank":
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: lightGreyColor,
            borderRadius: BorderRadius.circular(12),),
          child: Container(
            padding: EdgeInsets.only(top: 20,right: 20,left: 20,bottom:20),
            child: Column(
              children: [
                calculatorTextGenerator(),
                Container(
                  child:Padding(
                    padding: const EdgeInsets.only(top: 15.0,bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Current amount", style: calculateFont),
                        Text("${widget.current_amount}", style: calculateFont),
                        Text("L", style: calculateFont),
                      ],),
                  ),
                ),
                Container(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Final amount", style: calculateFont),
                      Text("     ${widget.final_amount}", style: calculateFont),
                      Text("L", style: calculateFont),
                    ],),
                ),
              ],
            ),
          ),
        );

    //distance calculator
      case "Distance":
        return Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: lightGreyColor,
              borderRadius: BorderRadius.circular(12),),
            child:Container(
                padding: EdgeInsets.only(top: 20,right: 20,left: 20,bottom:10),
                child: Center(
                    child: Column(
                        children: [
                          calculatorTextGenerator(),
                          SizedBox(height: 15,),
                          Container(
                            padding: EdgeInsets.only(bottom: 15),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(right: 15),
                                    child:Text("Distance", style: calculateFont)),
                                Text("               ${widget.distance}", style: calculateFont),
                                Text("km", style: calculateFont),
                              ],),
                          ),
                        ]
                    )
                )
            )
        );

    //Budget calculator
      default:
        return Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: lightGreyColor,
              borderRadius: BorderRadius.circular(12),),
            child:Container(
                padding: EdgeInsets.only(top: 20,right: 20,left: 20,bottom:10),
                child: Center(
                    child: Column(
                        children: [
                          calculatorTextGenerator(),
                          SizedBox(height: 15,),
                          Container(
                            padding: EdgeInsets.only(bottom: 15),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(right: 15),
                                    child:Text("Budget", style: calculateFont)),
                                Text("                  ${widget.budget}", style: calculateFont),
                                Text("Baht", style: calculateFont),
                              ],),
                          ),
                        ]
                    )
                )
            )
        );

    }
  }
  Widget calculatorTextGenerator() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 20),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(right: 23),
                  child:Text("Fuel Capacity", style: calculateFont)),
              Text("${widget.fuelCapacity}", style: calculateFont),
              Text("L", style: calculateFont),
            ],),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 15),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(right: 15),
                  child:Text("Fuel Consumption", style: calculateFont)),
              Text("${widget.fuelConsumption}", style: calculateFont),
              Text("km/L", style: calculateFont),
            ],),
        ),
        Container(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(right: 100),
                  child:Text("Fuel Price", style: calculateFont)),
              Text("${widget.fuelPrice}", style: calculateFont),
              Text("Baht/L", style: calculateFont),
            ],),
        ),
      ],
    );
  }
}
