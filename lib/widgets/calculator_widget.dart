import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constantPreset.dart';
import '../models/car_model.dart';
import '../screens/result_screen.dart';
import 'button_widget.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CalculatorWidget extends StatefulWidget {
  CarModel? car;
  String? type;
  String? fuelType;
  String? gasStation;
  int selectedGasStationIndex;

  double fuelPrice = 0.0;
  double fuelCapacity = 0.0;
  double fuelConsumption = 0.0;

  CalculatorWidget(
      {required this.car,
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

  double _currentValue=0;
  double _finalValue=0;
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
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Column(
              children: [
                calculatorTextGenerator(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Current amount", style: calculateFont),
                      Container(
                        width: 123,
                        child: TextFormField(
                          controller: _currentTankController,
                          decoration: InputDecoration(
                              hintText: 'Enter the amount',
                              border: InputBorder.none),
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
                    ],
                  ),
                ),

                slider('current_amount'),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.only(right: 20),
                          child: Text("Final amount", style: calculateFont)),
                      Container(
                        width: 123,
                        child: TextFormField(
                          controller: _finalTankController,
                          decoration: InputDecoration(
                              hintText: 'Enter the amount',
                              border: InputBorder.none),
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
                    ],
                  ),
                ),


                slider('final_amount'),
                SizedBox(
                  height: 20,
                ),
                //calculate button
                Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: ButtonWidget(
                        color: (widget.fuelCapacity != 0 &&
                                widget.fuelPrice != 0 &&
                                (current_amount != 0 ||
                                    _currentTankController.text !=
                                        0.toString()) &&
                                (final_amount != 0 ||
                                    _finalTankController.text !=
                                        0.toString()) &&
                                (final_amount > current_amount))
                            ? primaryColor
                            : greyColor2,
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
                          if (widget.car != null) {
                            if (widget.fuelPrice != 0) {
                              if ( _finalTankController.text != "") {
                                if (widget.fuelCapacity != 0 &&
                                    final_amount > current_amount) {
                                  List<double> res = tankCal(current_amount,final_amount);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return ResultScreen(
                                            car: widget.car,
                                            gasStation: widget.gasStation,
                                            gasStationIndex:
                                            widget.selectedGasStationIndex,
                                            fuelType: widget.fuelType,
                                            type: widget.type,
                                            res: res,
                                            fuelConsumption:
                                            widget.fuelConsumption,
                                            fuelPrice: widget.fuelPrice,
                                            fuelCapacity: widget.fuelCapacity,
                                            budget: budget,
                                            current_amount: current_amount,
                                            final_amount: final_amount,
                                            distance: distance);
                                      }));
                                } else {
                                  showSnackBar(context,
                                      'The final amount must be larger than the current amount');
                                }
                              } else {
                                showSnackBar(context,
                                    'Please enter the current or final tank level');
                              }
                            } else {
                              showSnackBar(
                                  context, 'Please select the fuel type');
                            }
                          }else{
                            showSnackBar(
                                context, 'Please select the car');
                          }
                        })),
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
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
                padding:
                    EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
                child: Column(children: [
                  calculatorTextGenerator(),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Distance", style: calculateFont),
                        Container(
                          width: 129,
                          child: TextFormField(
                            controller: _distanceController,
                            decoration: InputDecoration(
                                hintText: 'Enter the distance',
                                border: InputBorder.none),
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
                      ],
                    ),
                  ),
                  //calculate button
                  Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: ButtonWidget(
                          color: (widget.fuelCapacity != 0 &&
                                  widget.fuelPrice != 0 &&
                                  (distance != 0 &&
                                      _distanceController.text != 0.toString()))
                              ? primaryColor
                              : greyColor2,
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
                            if (widget.car != null) {
                              if (widget.fuelPrice != 0) {
                                if (_distanceController.text != "") {
                                  if (distance != 0) {
                                    List<double> res = distanceCal(distance);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return ResultScreen(
                                              car: widget.car,
                                              gasStation: widget.gasStation,
                                              gasStationIndex:
                                              widget.selectedGasStationIndex,
                                              fuelType: widget.fuelType,
                                              type: widget.type,
                                              res: res,
                                              fuelConsumption:
                                              widget.fuelConsumption,
                                              fuelPrice: widget.fuelPrice,
                                              fuelCapacity: widget.fuelCapacity,
                                              budget: budget,
                                              current_amount: current_amount,
                                              final_amount: final_amount,
                                              distance: distance);
                                        }));
                                  } else {
                                    showSnackBar(context,
                                        'Distance must be greater than zero');
                                  }
                                } else {
                                  showSnackBar(context,
                                      'Please enter the distance');
                                }
                              } else {
                                showSnackBar(
                                    context, 'Please select the fuel type');
                              }
                            }else{
                              showSnackBar(
                                  context, 'Please select the car');
                            }
                          }
                          )
                  ),
                ])));

      //Budget calculator
      default:
        return Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: lightGreyColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
                padding:
                    EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
                child: Center(
                    child: Column(children: [
                  calculatorTextGenerator(),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Budget", style: calculateFont),
                        Container(
                            width: 140,
                            child: TextFormField(
                              controller: _budgetController,
                              decoration: InputDecoration(
                                  hintText: 'Enter the amount',
                                  border: InputBorder.none),
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              onChanged: (input) {
                                setState(() {
                                  budget = double.parse(input);
                                });
                                print(budget);
                              },
                            )),
                        Text("Baht", style: calculateFont),
                      ],
                    ),
                  ),
                  //calculate button
                  Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: ButtonWidget(
                          color: (widget.fuelCapacity != 0 &&
                                  widget.fuelPrice != 0 &&
                                  (budget >= widget.fuelPrice &&
                                      _budgetController.text != 0.toString()))
                              ? primaryColor
                              : greyColor2,
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
                            if (widget.car != null) {
                              if (widget.fuelPrice != 0) {
                                if (_budgetController.text != "") {
                                  if (widget.fuelCapacity != 0 &&
                                      budget >= widget.fuelPrice) {
                                    List<double> res = budgetCal(budget);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ResultScreen(
                                          car: widget.car,
                                          gasStation: widget.gasStation,
                                          gasStationIndex:
                                              widget.selectedGasStationIndex,
                                          fuelType: widget.fuelType,
                                          type: widget.type,
                                          res: res,
                                          fuelConsumption:
                                              widget.fuelConsumption,
                                          fuelPrice: widget.fuelPrice,
                                          fuelCapacity: widget.fuelCapacity,
                                          budget: budget,
                                          current_amount: current_amount,
                                          final_amount: final_amount,
                                          distance: distance);
                                    }));
                                  } else {
                                    showSnackBar(context,
                                        'Budget must be at least equal to the fuel price');
                                  }
                                } else {
                                  showSnackBar(context,
                                      'Please enter the amount of budget');
                                }
                              } else {
                                showSnackBar(
                                    context, 'Please select the fuel type');
                              }
                            }else{
                              showSnackBar(
                                  context, 'Please select the car');
                            }
                          })),
                ]))));
    }
  }

  Widget calculatorTextGenerator() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(right: 23),
                  child: Text("Fuel Capacity", style: calculateFont)),
              Text("${widget.fuelCapacity}", style: calculateFont),
              Text("L", style: calculateFont),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Text("Fuel Consumption", style: calculateFont)),
              Text("${widget.fuelConsumption}", style: calculateFont),
              Text("km/L", style: calculateFont),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(right: 100),
                  child: Text("Fuel Price", style: calculateFont)),
              Text("${widget.fuelPrice}", style: calculateFont),
              Text("Baht/L", style: calculateFont),
            ],
          ),
        ),
      ],
    );
  }

  Widget slider(String type_amount) {
    if (widget.car != null){
      return SfSlider(
        min: 0.0,
        max: widget.fuelCapacity,
        value: type_amount == 'current_amount' ? current_amount : final_amount,
        interval: widget.fuelCapacity / 4,
        showTicks: true,
        showLabels: true,
        enableTooltip: true,
        activeColor: primaryColor,
        inactiveColor: unavailableColor,
        stepSize: 1,
        onChanged: (dynamic value) {
          setState(() {
            if (type_amount == 'current_amount') {
              current_amount = double.parse(value.toStringAsFixed(2));
              _currentTankController.text = current_amount.toStringAsFixed(1);

            } else {
              final_amount = double.parse(value.toStringAsFixed(2));
              _finalTankController.text = final_amount.toStringAsFixed(1);
            }
          });
        },
      );
    }else{
    return SfSlider(
      min: 0.0,
      max: 100.0,
      value: type_amount == 'current_amount' ? _currentValue : _finalValue,
      interval:25,
      showTicks: true,
      showLabels: true,
      enableTooltip: true,
      activeColor: primaryColor,
      inactiveColor: unavailableColor,
      stepSize: 1,
      onChanged: (dynamic value) {
        setState(() {
          if (type_amount == 'current_amount') {
            _currentValue = double.parse(value.toStringAsFixed(2));
            _currentTankController.text = _currentValue.toStringAsFixed(1);
          } else {
            _finalValue = double.parse(value.toStringAsFixed(2));
            _finalTankController.text = _finalValue.toStringAsFixed(1);
          }
        });
      },
    );
    }

  }

  void showSnackBar(context, text) {
    showTopSnackBar(
      Overlay.of(context)!,
      CustomSnackBar.error(
        message: "${text}",
        textStyle: TextStyle(
            fontSize: 18, color: whiteColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  //Budget calculator
  List<double> budgetCal(double budget) {
    double result = budget / widget.fuelPrice;
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
    double fuelTank = distance / widget.fuelConsumption;
    double result = fuelTank * widget.fuelPrice;
    return [result, fuelTank];
  }
}
// test