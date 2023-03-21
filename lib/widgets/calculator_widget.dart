import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constantPreset.dart';
import '../models/car_model.dart';
import '../screens/result_screen.dart';
import 'button_widget.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CalculatorWidget extends StatefulWidget {
  CarModel? car;
  String? type;
  String? fuelType;
  String? gasStation;
  int selectedGasStationIndex;

  double fuelPrice = 0.0;
  double fuelCapacity = 0.0;
  double fuelConsumption = 0.0;


  CalculatorWidget({
    required this.car,
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
  //Budget parameter
  double budget = 0.0;

  //Tank parameter
  double current_amount = 0;
  double final_amount = 0;

  //Distance parameter
  double distance = 0.0;

  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _currentTankController = TextEditingController();
  final TextEditingController _finalTankController = TextEditingController();
  final TextEditingController _distanceController = TextEditingController();


  @override
  void initState() {
    _budgetController.clear();
    _currentTankController.clear();
    _finalTankController.clear();
    _distanceController.clear();
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
            padding: EdgeInsets.only(top: 20,right: 20,left: 20),
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
                          controller: _currentTankController,
                          decoration: InputDecoration(
                              hintText: 'Enter the amount',
                              border: InputBorder.none
                          ),
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.number,
                          onChanged: (input) {
                            setState(() {
                              current_amount = double.parse(input);
                            });
                            print(current_amount);
                          },
                        ),
                      ),
                      Text("L", style: calculateFont),
                    ],),
                ),

                slider('current_amount'),

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
                          controller: _finalTankController,
                          decoration: InputDecoration(
                              hintText: 'Enter the amount',
                              border: InputBorder.none
                          ),
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.number,
                          onChanged: (input) {
                            setState(() {
                              final_amount = double.parse(input);
                            });
                            print(final_amount);
                          },
                        ),
                      ),
                      Text("L", style: calculateFont),
                    ],),
                ),

                slider('final_amount'),
                SizedBox(
                  height: 20,
                ),
                //calculate button
                Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child:ButtonWidget(
                        color: (widget.fuelCapacity!=0 && widget.fuelPrice!=0 && (current_amount!=0 || _currentTankController.text != 0.toString()) && (final_amount!=0 || _finalTankController.text != 0.toString())
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
                              && (current_amount!=0 || _currentTankController.text != 0.toString()) && (final_amount!=0 || _finalTankController.text != 0.toString())){
                            List<int> res = tankCal(current_amount,final_amount);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return ResultScreen(
                                      car: widget.car,
                                      gasStation: widget.gasStation,
                                      gasStationIndex: widget.selectedGasStationIndex,
                                      fuelType: widget.fuelType,
                                      type: widget.type,
                                      res: res,
                                      fuelConsumption: widget.fuelConsumption,
                                      fuelPrice: widget.fuelPrice,
                                      fuelCapacity: widget.fuelCapacity,
                                      budget: budget,
                                      current_amount: current_amount,
                                      final_amount: final_amount,
                                      distance: distance); }));
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
                            controller: _distanceController,
                            decoration: InputDecoration(
                                hintText: 'Enter the amount',
                                border: InputBorder.none
                            ),
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.number,
                            onChanged: (input) {
                              setState(() {
                                distance = double.parse(input);
                              });
                              print(distance);
                            },
                          ),
                        ),
                        Text("km", style: calculateFont),
                      ],),
                  ),
                    //calculate button
                    Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child:ButtonWidget(
                            color: (widget.fuelCapacity!=0 && widget.fuelPrice!=0
                                && (budget!=0 || _distanceController.text != 0.toString())
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
                                  && (budget!=0 || _distanceController.text != 0.toString())){
                                List<int> res = distanceCal(distance);

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return ResultScreen(
                                          car: widget.car,
                                          gasStation: widget.gasStation,
                                          gasStationIndex: widget.selectedGasStationIndex,
                                          fuelType: widget.fuelType,
                                          type: widget.type,
                                          res: res,
                                          fuelConsumption: widget.fuelConsumption,
                                          fuelPrice: widget.fuelPrice,
                                          fuelCapacity: widget.fuelCapacity,
                                          budget: budget,
                                          current_amount: current_amount,
                                          final_amount: final_amount,
                                          distance: distance); }));
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
                                  controller: _budgetController,
                              decoration: InputDecoration(
                                hintText: 'Enter the amount',
                                border: InputBorder.none
                              ),
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              onChanged: (input) {
                                setState(() {
                                  budget = double.parse(input);
                                });
                                print(budget);
                                },

                            )
                            ),
                            Text("Baht", style: calculateFont),
                          ],),
                      ),
                      //calculate button
                      Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child:ButtonWidget(
                              color: (widget.fuelCapacity!=0 && widget.fuelPrice!=0
                                  && (budget!=0 || _budgetController.text != 0.toString())
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
                                    && (budget!=0 || _budgetController.text != 0.toString())){
                                  List<int> res = budgetCal(budget);

                                  print(widget.fuelType);
                                  print(widget.gasStation);
                                  print(widget.selectedGasStationIndex);
                                  print(widget.type);
                                  print(res);

                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return ResultScreen(
                                            car: widget.car,
                                            gasStation: widget.gasStation,
                                            gasStationIndex: widget.selectedGasStationIndex,
                                            fuelType: widget.fuelType,
                                            type: widget.type,
                                            res: res,
                                            fuelConsumption: widget.fuelConsumption,
                                            fuelPrice: widget.fuelPrice,
                                            fuelCapacity: widget.fuelCapacity,
                                            budget: budget,
                                            current_amount: current_amount,
                                            final_amount: final_amount,
                                            distance: distance); }));
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

  Widget slider(String type_amount) {
    return SfSlider(
      min: 0.0,
      max: widget.fuelCapacity,
      value: type_amount=='current_amount'? current_amount:final_amount,
      interval: widget.fuelCapacity/4,
      showTicks: true,
      showLabels: true,
      enableTooltip: true,
      activeColor: primaryColor,
      inactiveColor: unavailableColor,
      stepSize: 1,
      onChanged: (dynamic value){
        setState(() {
          if (type_amount=='current_amount'){
            current_amount = value;
            _currentTankController.text=current_amount.toStringAsFixed(1);
          }
          else{
            final_amount = value;
            _finalTankController.text=final_amount.toStringAsFixed(1);
          }
        });
      },
    );
  }




  //Budget calculator
  List<int> budgetCal(double budget) {
    double result = budget/widget.fuelPrice;
    double distance = result * widget.fuelConsumption;
    return [result.toInt(), distance.toInt()];
  }

  //Tank calculator
  List<int> tankCal(double current, double desired) {
    double fuelTank = desired - current;
    double result = fuelTank * widget.fuelPrice;
    double distance = desired * widget.fuelConsumption;
    return [result.toInt(), distance.toInt()];
  }

  //Distance calculator
  List<int> distanceCal(double distance) {
    double fuelTank = distance/widget.fuelConsumption;
    double result = fuelTank * widget.fuelPrice;
    return [result.toInt(), fuelTank.toInt()];
  }
}
