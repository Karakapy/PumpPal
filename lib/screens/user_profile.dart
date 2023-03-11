import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pumppal/constantPreset.dart';
import 'package:carbon_icons/carbon_icons.dart';

import '../widgets/button_widget.dart';
import '../widgets/nav_bar_widget.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  List<IconData> iconList = [
    //list of icons that required by animated navigation bar.
    Icons.home_outlined,
    Icons.person_outline,
  ];

  int _bottomNavIndex = 1;

  void _navigation(index) {
    setState(() {
      _bottomNavIndex = index;
    });
    if (_bottomNavIndex == 0) {
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: [
                Container(
                    height: 370.0,
                    decoration: new BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          whiteColor,
                          primaryColor,
                        ],
                      ),
                      // color: primaryColor,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width, 150.0)),
                    ),
                    padding: EdgeInsets.only(left: 20, right: 20, top: 70),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: ButtonWidget(
                                theChild: Container(
                                  width: 100.0,
                                  height: 50.0,
                                  child: const Center(
                                    child: Text(
                                      "Log out",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'montserrat',
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                                theOnTapFunc: () {
                                  print('Log out');
                                },
                                color: redColor,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/user_profile.png",
                              height: 180,
                              width: 180,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PumpPal@hotmail.com',
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ],
                        ),
                        Container(),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: Row(
                    children: [
                      Text("List of Cars", style: buttonFont),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [

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
                                Icon(Icons.add_circle, color:greyColor2,size: 60),
                                Text("Add new car",style: TextStyle(
                                    fontFamily:"Inter",
                                    fontSize: 20,
                                    color: Colors.grey),),
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

              ],
            ),
          ),)
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
          Navigator.pushNamed(context, '/fuelCalculator');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavBarWidget(
        currentIndex: _bottomNavIndex,
        onTap: (index) => _navigation(index),
      ),
    );
  }
}
