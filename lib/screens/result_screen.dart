import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pumppal/constantPreset.dart';
import 'package:pumppal/models/car_model.dart';
import 'package:pumppal/screens/home_screen.dart';
import 'package:pumppal/widgets/result_caculator_widget.dart';
import 'package:pumppal/widgets/result_widget.dart';

import '../parser/car_name_parser.dart';
import '../widgets/button_widget.dart';
import '../widgets/calculator_widget.dart';

//https://pub.dev/packages/carbon_icons/install

class ResultScreen extends StatefulWidget {

  const ResultScreen({
    required this.car,
    required this.gasStation,
    required this.gasStationIndex,
    required this.fuelType,
    required this.type,
    required this.res,
    required this.fuelConsumption,
    required this.fuelPrice,
    required this.fuelCapacity,
    required this.budget,
    required this.current_amount,
    required this.final_amount,
    required this.distance,


  });

  final CarModel? car;
  final String? gasStation;
  final String? fuelType;
  final String? type;
  final int gasStationIndex;
  final List<int> res;
  final double fuelConsumption;
  final double fuelPrice;
  final double fuelCapacity;
  final double budget;
  final double current_amount;
  final double final_amount;
  final double distance;


  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {


  @override
  Widget build(BuildContext context) {
    print(widget.res);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: gradientBg,
        child: Column(
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
                      color: whiteColor,

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
                color: whiteColor,
              ),),
            ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.all(25),
                children: [
                  Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 10,bottom: 10),
                            child:Text("Car", style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 20,
                                color:whiteColor,
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
                              Expanded(
                                flex: 2,
                                child: Column(
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
                              ),
                              Expanded(
                                flex: 3,
                                child: Image.network('https://cdn.imagin.studio/getImage?customer=thdaranthawornwattanapolcompany&make=${widget.car?.make}&modelFamily=${widget.car?.model}&modelYear=${widget.car?.makeYear}',
                                  width: 220,
                                  height: 220,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 10,bottom: 10),
                            child:Text("Fuel type", style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 20,
                                color:whiteColor,
                                fontWeight: FontWeight.bold
                            ))
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 30,bottom: 10,right: 10),
                            child:Text("${widget.fuelType}", style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              color:whiteColor,
                            ))
                        ),
                      ]
                  ),

                  SizedBox(height: 20,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 10,bottom: 10),
                            child:Text("Petrol station", style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 20,
                                color:whiteColor,
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
                                  color:whiteColor,
                                ))
                            ),
                            Container(
                                padding: EdgeInsets.only(bottom: 10,right: 10),
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
                            padding: EdgeInsets.only(left: 10,bottom: 10),
                            child:Text("Calculate by ${widget.type}", style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 20,
                                color:whiteColor,
                                fontWeight: FontWeight.bold
                            ))
                        ),
                      ]
                  ),
                  Container(
                    // height: 115,
                      width: 340,

                      child: ResultCalculatorWidget(
                          car: widget.car,
                          type: widget.type,
                          fuelType: widget.fuelType,
                          gasStation: widget.gasStation,
                          selectedGasStationIndex: widget.gasStationIndex,
                          fuelConsumption: widget.fuelConsumption,
                          fuelPrice: widget.fuelPrice,
                          fuelCapacity: widget.fuelCapacity,
                          budget: widget.budget,
                          current_amount: widget.current_amount,
                          final_amount: widget.final_amount,
                          distance: widget.distance
                      )
                  ),

                  ResultWidget(res: widget.res,type: widget.type,),

                ],
              ),
            ),



            SizedBox(height: 20,),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child:ButtonWidget(
                  color: primaryColor,

                  theChild: Container(
                    width: 312.0,
                    height: 64.0,
                    child: const Center(
                      child: Text(
                        "Done",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'montserrat',
                          color: blackColor,
                        ),
                      ),
                    ),
                  ),
                  theOnTapFunc: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) { return HomeScreen(); }));


                  },
                  // theOnTapFunc: () {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) { return const ResultScreen(); }));
                  // }
                )
            ),

          ],

        ),
      ),
    );
  }
}
