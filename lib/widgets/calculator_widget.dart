import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constantPreset.dart';
import '../screens/result_screen.dart';
import 'button_widget.dart';

class CalculatorWidget extends StatefulWidget {
  String type;
  String? fuelType;
  String gasStation;
  int selectedGasStationIndex;

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
    required this.fuelType,
    required this.gasStation,
    required this.selectedGasStationIndex,
    required this.fuelConsumption,
    required this.fuelPrice,
    required this.fuelCapacity});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
            padding: EdgeInsets.only(top: 20,right: 20,left: 20,bottom:10),
            child: Column(
              children: [
                calculatorTextGenerator(),
                Container(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Current amount", style: calculateFont),
                      Container(
                        width: 123,
                        child:TextFormField(
                          controller: _controller,
                          decoration: InputDecoration(
                              hintText: 'Enter the amount',
                              border: InputBorder.none
                          ),
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.number,
                          onChanged: (input) {
                            setState(() {
                              widget.current = double.parse(input);
                            });
                            print(widget.current);
                          },
                        ),
                      ),
                      Text("L", style: calculateFont),
                    ],),
                ),
                Container(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.only(right: 20),
                          child:Text("Final amount", style: calculateFont)),
                      Container(
                        width: 123,
                        child:TextFormField(
                          controller: _controller,
                          decoration: InputDecoration(
                              hintText: 'Enter the amount',
                              border: InputBorder.none
                          ),
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.number,
                          onChanged: (input) {
                            setState(() {
                              widget.desired = double.parse(input);
                            });
                            print(widget.desired);
                          },
                        ),
                      ),
                      Text("L", style: calculateFont),
                    ],),
                ),
                //calculate button
                Container(
                    margin: EdgeInsets.only(bottom: 40),
                    child:ButtonWidget(
                        color: (widget.fuelCapacity!=0 && widget.fuelPrice!=0 && widget.budget!=0
                        )? primaryColor: greyColor2,
                        theChild: Container(
                          width: 312.0,
                          height: 64.0,
                          child: const Center(
                            child: Text(
                              "Calculate",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'montserrat',
                                color: blackColor,
                              ),
                            ),
                          ),
                        ),
                        theOnTapFunc: () {
                          if(widget.fuelCapacity!=0 && widget.fuelPrice!=0
                              && widget.current!=0 && widget.desired!=0){
                            List<double> res = tankCal(widget.current,widget.desired);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return ResultScreen(
                                      fuelType: widget.fuelType,
                                      gasStation: widget.gasStation,
                                      gasStationIndex: widget.selectedGasStationIndex,
                                      type: widget.type,
                                      res: res
                                  ); }));
                          }
                        }
                    )
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
            child: Container(
              padding: EdgeInsets.only(top: 20,right: 20,left: 20,bottom:10),
              child: Column(
                  children: [
                  calculatorTextGenerator(),
                  Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Distance", style: calculateFont),
                        Container(
                          width: 123,
                          child:TextFormField(
                            controller: _controller,
                            decoration: InputDecoration(
                                hintText: 'Enter the amount',
                                border: InputBorder.none
                            ),
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.number,
                            onChanged: (input) {
                              setState(() {
                                widget.distance = double.parse(input);
                              });
                              print(widget.distance);
                            },
                          ),
                        ),
                        Text("km", style: calculateFont),
                      ],),
                  ),
                    //calculate button
                    Container(
                        margin: EdgeInsets.only(bottom: 40),
                        child:ButtonWidget(
                            color: (widget.fuelCapacity!=0 && widget.fuelPrice!=0
                                && widget.budget!=0
                            )? primaryColor: greyColor2,
                            theChild: Container(
                              width: 312.0,
                              height: 64.0,
                              child: const Center(
                                child: Text(
                                  "Calculate",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'montserrat',
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ),
                            theOnTapFunc: () {
                              if(widget.fuelCapacity!=0 && widget.fuelPrice!=0
                                  && widget.distance!=0){
                                List<double> res = distanceCal(widget.distance);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return ResultScreen(
                                          fuelType: widget.fuelType,
                                          gasStation: widget.gasStation,
                                          gasStationIndex: widget.selectedGasStationIndex,
                                          type: widget.type,
                                          res: res
                                      ); }));
                              }
                            }
                        )
                    ),
              ]
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
                      Container(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Budget", style: calculateFont),
                            Container(
                              width: 123,
                                child:TextFormField(
                                  controller: _controller,
                              decoration: InputDecoration(
                                hintText: 'Enter the amount',
                                border: InputBorder.none
                              ),
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              onChanged: (input) {
                                setState(() {
                                  widget.budget = double.parse(input);
                                });
                                print(widget.budget);
                                },

                            )
                            ),
                            Text("Baht", style: calculateFont),
                          ],),
                      ),
                      //calculate button
                      Container(
                          margin: EdgeInsets.only(bottom: 40),
                          child:ButtonWidget(
                              color: (widget.fuelCapacity!=0 && widget.fuelPrice!=0
                                  && widget.budget!=0
                              )? primaryColor: greyColor2,
                              theChild: Container(
                                width: 312.0,
                                height: 64.0,
                                child: const Center(
                                  child: Text(
                                    "Calculate",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'montserrat',
                                      color: blackColor,
                                    ),
                                  ),
                                ),
                              ),
                              theOnTapFunc: () {
                                if(widget.fuelCapacity!=0 && widget.fuelPrice!=0
                                    && widget.budget!=0){
                                  List<double> res = budgetCal(widget.budget);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return ResultScreen(
                                            fuelType: widget.fuelType,
                                            gasStation: widget.gasStation,
                                            gasStationIndex: widget.selectedGasStationIndex,
                                            type: widget.type,
                                            res: res
                                        ); }));
                                }
                              }
                          )
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
          padding: EdgeInsets.only(bottom: 15),
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

  //Budget calculator
  List<double> budgetCal(double budget) {
    double result = budget/widget.fuelPrice;
    double distance = result * widget.fuelConsumption;
    return [result, distance];
  }

  //Tank calculator
  List<double> tankCal(double current, double desired) {
    double fuelTank = desired - current;
    double result = fuelTank * widget.fuelPrice;
    double distance = desired * widget.fuelConsumption;
    return [result, distance];
  }

  //Distance calculator
  List<double> distanceCal(double distance) {
    double fuelTank = distance/widget.fuelConsumption;
    double result = fuelTank * widget.fuelPrice;
    return [result, fuelTank];
  }
}
