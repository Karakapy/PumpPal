import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pumppal/screens/result_screen.dart';
import 'package:pumppal/widgets/button_widget.dart';

import '../constantPreset.dart';

class FuelCalculatorScreen extends StatefulWidget {
  const FuelCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<FuelCalculatorScreen> createState() => _FuelCalculatorScreenState();
}

class _FuelCalculatorScreenState extends State<FuelCalculatorScreen> {
  String gasStation = '';
  String fuelType = '';
  double fuelPrice = 0.0;
  //Budget parameter
  double budget = 0.0;
  //car data
  double fuelCapacity = 0.0;
  double fuelConsumption = 0.0;
  //bar
  int _selectedGasStationIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          padding: const EdgeInsets.all(20),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body:
      Container(
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff1F1F1F),
                 Colors.white,
              ],
    )
        ),
        //Title
        child: Column(
          children: [
            Container(
                child: const Center(
                    child: Text("Fuel",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40 ,)
                    )
                )),
            Container(
              child: const Center(
                child: Text("Calculator",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,fontWeight:
                    FontWeight.bold,
                      fontSize: 40 ,)),
              ),
            ),

            //gas station bar
            Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedGasStationIndex = index;
                        print(index);
                      });
                    },
                    child: Container(
                      width: 48.5,
                      color: _selectedGasStationIndex == index ? primaryColor : whiteColor,
                      child: Center(
                        child: Image.asset(
                          'assets/station_logos/station$index.png',
                          width: 35.0,
                          height: 35.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            //calculate button
            ButtonWidget(theChild: Container(
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) { return const ResultScreen(); }));
            }
            )
          ],
        ),
      ),
    );
  }

  //Budget calculator
  List<double> budgetCal(double budget) {
    double result = budget/fuelPrice;
    double distance = result * fuelConsumption;
    return [result, distance];
  }

  //Tank calculator
  List<double> tankCal(double current, double desired) {
    double fuelTank = desired - current;
    double result = fuelTank*fuelPrice;
    double distance = desired * fuelConsumption;
    return [result, distance];
  }

  //Distance calculator
  List<double> distanceCal(double distance) {
    double fuelTank = distance/fuelConsumption;
    double result = fuelTank*fuelPrice;
    return [result, fuelTank];
  }
}
