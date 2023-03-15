import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pumppal/api/api_oil_price.dart';
import 'package:pumppal/parser/oil_name_parser.dart';
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
  String? fuelType;
  double fuelPrice = 0.0;
  String type ='';
  //car data
  double fuelCapacity = 0.0;
  double fuelConsumption = 0.0;
  //bar index
  int _selectedGasStationIndex = 0;
  int _selectedCalculatorIndex = 0;

  FirebaseAuth? auth;

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

    // FirebaseAuth auth = FirebaseAuth.instance;
    // final user = auth.currentUser;
    // final email = user?.email;

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
                      Navigator.push(context,MaterialPageRoute(builder: (context) => UserProfileScreen()));
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
                            fuelType = null;
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
                FutureBuilder(
                  future: getOilPrice(),
                  builder: (context,snapshot) {
                  if (!snapshot.hasData) {
                    return Text("no data");
                  } else {
                    final oil = snapshot.data!;
                    final oilList = oil[_selectedGasStationIndex].map((e) => oilNameParser(e.name)).toList();
                    return Container(
                      width: 339,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 20),
                      child: DropdownButtonFormField2<String>(
                        value: fuelType,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        isExpanded: true,
                        hint: const Text(
                          'Select the fuel type',
                          style: TextStyle(fontSize: 20),
                        ),
                        items: oilList.map<DropdownMenuItem<String>>((String? value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value!, style: buttonFont,),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select the fuel type.';
                          }
                          return null;
                        },
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            final oilName = revOilNameParser(value!);
                            final oilGetPrice = oil[_selectedGasStationIndex].firstWhere(
                                    (element) => element.name == oilName);
                            fuelType = value!;
                            fuelPrice = oilGetPrice.price;
                          });
                        },
                        // onSaved: (value) {
                        //   selectedModel = value.toString();
                        // },
                        buttonStyleData: ButtonStyleData(
                            height: 60,
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: lightGreyColor
                            )
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: blackColor,
                          ),
                          iconSize: 30,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                    );
                  }
                }
                ),

                //Calculator bar
                Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          child: const Text("Calculator Type", style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              color:Colors.white))
                      ),
                    ]
                ),
                SizedBox(height: 5),
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
                CalculatorWidget(
                  type: type,
                  fuelType: fuelType,
                  gasStation: gasStation,
                  selectedGasStationIndex: _selectedGasStationIndex,
                  fuelConsumption: fuelConsumption,
                  fuelPrice: fuelPrice,
                  fuelCapacity: fuelCapacity,),
              ],
            ),
          ),
          ],
          ),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        backgroundColor: primaryColor,
        child: const Icon(
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

  // _setCar(BuildContext context) {
  //   final
  // }

}
