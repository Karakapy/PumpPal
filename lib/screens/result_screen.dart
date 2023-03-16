import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pumppal/constantPreset.dart';
import 'package:pumppal/models/car_model.dart';

import '../parser/car_name_parser.dart';
import '../widgets/calculator_widget.dart';

//https://pub.dev/packages/carbon_icons/install

class ResultScreen extends StatefulWidget {

  const ResultScreen({
    required this.car,
    required this.gasStation,
    required this.gasStationIndex,
    required this.fuelType,
    required this.type,
    required this.res
  });

  final CarModel? car;
  final String? gasStation;
  final String? fuelType;
  final String? type;
  final int gasStationIndex;
  final List<double> res;


  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  double fuelPrice = 0.0;
  String type ='';
  double fuelConsumption = 0.0;
  double fuelCapacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 70,),
          Container(child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 35,
                    color: blackColor,

                  ),
                ),
              ],
            ),
          ),),

          // SizedBox(height: 5,),
          Center(
            child: Text("Result", style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),),
          ),

          SizedBox(height: 10,),
          Row(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 30,bottom: 10),
                    child:Text("Car", style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        color:blackColor,
                      fontWeight: FontWeight.bold
                    ))
                ),
              ]
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: lightGreyColor,
              ),
              child: SizedBox(
                width: 340,
                height: 115,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Container(
                            child: Text("${carNameParser(widget.car?.make)} ", style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 20,
                                color: Colors.black
                            ),),
                          ),
                          Container(
                            child: Text("${widget.car?.model}", style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 20,
                                color: Colors.black
                            ),),
                          ),
                          Container(
                            child: Text("${widget.car?.makeYear.toInt()}",style: TextStyle(
                                fontFamily:"Inter",
                                fontSize: 20,
                                color: greyColor),),
                          ),
                        ],
                      ),
                      Image.asset('assets/defaultCarImage.png',
                        height: 96,
                        width:160.0,),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 30,bottom: 10),
                    child:Text("Fuel type", style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        color:blackColor,
                        fontWeight: FontWeight.bold
                    ))
                ),
                Container(
                    padding: EdgeInsets.only(left: 30,bottom: 10,right: 30),
                    child:Text("${widget.fuelType}", style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        color:blackColor,
                    ))
                ),
              ]
          ),

          SizedBox(height: 20,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 30,bottom: 10),
                    child:Text("Petrol station", style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        color:blackColor,
                        fontWeight: FontWeight.bold
                    ))
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 30,bottom: 10,right: 10),
                        child:Text("${widget.gasStation}", style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          color:blackColor,
                        ))
                    ),
                    Container(
                        padding: EdgeInsets.only(bottom: 10,right: 30),
                        child: Image.asset('assets/station_logos/station${widget.gasStationIndex}.png',
                        height: 32,
                        width: 32,
                        )
                    ),
                  ],
                ),
              ]
          ),

          SizedBox(height: 20,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 30,bottom: 10),
                    child:Text("Calcualate by ${widget.type}", style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        color:blackColor,
                        fontWeight: FontWeight.bold
                    ))
                ),
              ]
          ),
          Container(
            // height: 115,
            width: 340,

            child: CalculatorWidget(
              car: widget.car,
              type: type,
              fuelType: widget.fuelType,
              gasStation: widget.gasStation,
              selectedGasStationIndex: widget.gasStationIndex,
              fuelConsumption: fuelConsumption,
              fuelPrice: fuelPrice,
              fuelCapacity: fuelCapacity,),
          ),

        ],

      ),
    );
  }
}
