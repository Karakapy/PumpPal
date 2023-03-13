import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pumppal/screens/home_screen.dart';
import 'package:pumppal/screens/result_screen.dart';
import 'package:pumppal/screens/user_profile.dart';
import 'package:pumppal/widgets/button_widget.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:pumppal/widgets/calculator_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constantPreset.dart';
import '../widgets/nav_bar_widget.dart';

class FuelCalculatorScreen extends StatefulWidget {
  const FuelCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<FuelCalculatorScreen> createState() => _FuelCalculatorScreenState();
}

class _FuelCalculatorScreenState extends State<FuelCalculatorScreen> {
  String gasStation = '';
  String fuelType = '';
  double fuelPrice = 0.0;
  String type ='';
  //car data
  double fuelCapacity = 0.0;
  double fuelConsumption = 0.0;
  //bar index
  int _selectedGasStationIndex = -1;
  int _selectedFuelTypeIndex = -1;
  int _selectedCalculatorIndex = -1;


  List<String> fuelTypeList = [
    "E85",
    "E20",
    "E91",
    "E95",
    "B7",
    "B10",
    "B20"
  ];

  List<String> gasStationList = [
    "PTT",
    "Bang Chak",
    "Shell",
    "Esso",
    "Caltex",
    "PT",
    "Susco"
  ];

  List<String> calculatorList = [
    "Budget",
    "Tank",
    "Distance",
  ];

  List<IconData> iconList = [ //list of icons that required by animated navigation bar.
    Icons.home_outlined,
    Icons.person_outline,
  ];

  int _bottomNavIndex = -1;

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  String? token;
  void checkToken(){
    SharedPreferences.getInstance().then((prefs) {
      final userToken = prefs.getString('user');

      setState(() {
        token=userToken;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    void _navigation(index){

      setState(() {
        _bottomNavIndex = index;
      });
      if (_bottomNavIndex==0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
      if (_bottomNavIndex==1){
        if(token != null){
          Navigator.pushNamed(context, '/profile');
        }else{
          Navigator.pushNamed(context, '/login');
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body:
          ListView(scrollDirection: Axis.vertical,
          children: [
            Container(
            padding: EdgeInsets.only(right:22, left:22),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    blackColor,
                    Colors.white,
                  ],
                )
            ),
            /**
             * Title
             */
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 30),
                    child: const Center(
                        child: Text("Fuel",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 50 ,)
                        )
                    )),
                Container(
                  child: const Center(
                    child: Text("Calculator",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,fontWeight:
                        FontWeight.bold,
                          fontSize: 50 ,)),
                  ),
                ),

                /**
                 * Car
                 */
                SizedBox(height: 20,),
                Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                          child:Text("Car", style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          color:Colors.white))
                      ),
                    ]
                ),

                // need shared pref keeping data
                SizedBox(height: 5,),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addCar');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: lightGreyColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19))),
                    child: SizedBox(
                      height: 115,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Wrap(
                          children: [
                            Column(
                              children: [
                                Icon(Icons.add_circle, color: Colors.grey,size: 60),
                                Text("Add new car",style: TextStyle(
                                    fontFamily:"Inter",
                                    fontSize: 20,
                                    color: Color(0xffC6C6C6)),),
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

                //gas station bar
                Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          child:Text("Gas Station", style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              color:Colors.white))
                      ),
                    ]
                ),
                SizedBox(height: 5,),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: 339,
                  height: 50,
                  decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedGasStationIndex = index;
                            gasStation = gasStationList[index];
                            print(_selectedGasStationIndex);
                            print(gasStation);
                          });
                        },
                        child: Container(
                          width: 48.5,
                          decoration: BoxDecoration(
                            color: _selectedGasStationIndex == index ? primaryColor : lightGreyColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
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

                //fuel type bar
                Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          child:Text("Fuel Type", style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              color:Colors.white))
                      ),
                    ]
                ),
                SizedBox(height: 5,),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: 339,
                  height: 50,
                  decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedFuelTypeIndex = index;
                            fuelType = fuelTypeList[index];
                            print(fuelType);
                          });
                        },
                        child: Container(
                          width: 48.5,
                        decoration: BoxDecoration(
                            color: _selectedFuelTypeIndex == index ? primaryColor : lightGreyColor,
                            borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Text(fuelTypeList[index],style: buttonFont,)
                          ),
                        ),
                      );
                    },
                  ),
                ),

                //Calculator bar
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: 327,
                  height: 50,
                  decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCalculatorIndex = index;
                            type = calculatorList[index];
                            print(type);
                          });
                        },
                        child: Container(
                          width: 109,
                          decoration: BoxDecoration(
                              color: _selectedCalculatorIndex == index ? primaryColor : lightGreyColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Text(calculatorList[index],style: buttonFont,)
                          ),
                        ),
                      );
                    },
                  ),
                ),

                /**
                 * Data entry
                 * */
                CalculatorWidget(type: type,
                  fuelConsumption: fuelConsumption,
                  fuelPrice: fuelPrice,
                  fuelCapacity: fuelCapacity,),

                //calculate button
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                    child:ButtonWidget(
                        color: (fuelType != '' && gasStation != '' && type !='')? primaryColor: greyColor2,
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
                          if(fuelType != '' && gasStation != '' && type !=''){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) { return ResultScreen(fuelType: fuelType,gasStation: gasStation,gasStationIndex: _selectedGasStationIndex,type: type,); }));
                          }

                    }
                )
                ),
              ],
            ),
          ),
          ],
          ),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        backgroundColor: primaryColor,
        child: Icon(
          CarbonIcons.calculation,
          color: blackColor,
          size: 30,
        ),
        onPressed: () {
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavBarWidget(
        currentIndex: _bottomNavIndex,
        onTap:(index)=>_navigation(index),
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
