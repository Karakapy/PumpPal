import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pumppal/constantPreset.dart';
import 'package:pumppal/widgets/fuel_price_widget.dart';
import 'package:intl/intl.dart';
import 'package:carbon_icons/carbon_icons.dart';



class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedItemIndex = -1;

  List<IconData> iconList = [ //list of icons that required by animated navigation bar.
    Icons.home_outlined,
    Icons.person_outline,
  ];

  int _bottomNavIndex = 0;


  @override
  Widget build(BuildContext context) {
    String currentTime = DateFormat('dd/MM/yyyy kk:mm:ss').format(DateTime.now());

    @override
    void initState() {
      super.initState();
      currentTime = DateFormat('dd/MM/yyyy kk:mm:ss').format(DateTime.now());
    }

    void _refreshTime() {
      setState(() {
        currentTime = DateFormat('dd/MM/yyyy kk:mm:ss').format(DateTime.now());
        // var dateUtc = DateTime.now().toUtc().toLocal();
      });
    }

    void _navigation(index){

      setState(() {
        _bottomNavIndex = index;
      });
      if (_bottomNavIndex==1){
        Navigator.pushNamed(context, '/login');
      }

    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: blackColor2,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                greyBlueColor,
                blackColor2,
              ],
            )
        ),

        child: Column(
          children: [
            SizedBox(height: 100,),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 22.0),
                  child: Text("PumpPal", style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    fontFamily: 'montserrat'
                ),),),
              ],
            ),

            SizedBox(height: 25,),
            Container(
              width: 339,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: lightGreyColor,
              ),
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text("FUEL PRICE",style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'montserrat',
                                  ),),
                                ),
                                Container(
                                  child: Text("updated at $currentTime",style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'montserrat'
                                  ),),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  child: GestureDetector(
                                    onTap: _refreshTime,
                                    child: Icon(
                                      Icons.refresh,
                                      size: 30,
                                      color: blackColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      // borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedItemIndex = index;
                              print(index);
                            });
                          },
                          child: Container(
                            width: 48.5,
                            color: _selectedItemIndex == index ? primaryColor : whiteColor,
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
                  Container(child: Column(
                    children: [
                      FuelPriceWidget(text: "Gasohol 95", price: 36.94),
                      FuelPriceWidget(text: "Gasohol 91", price: 36.64),
                      FuelPriceWidget(text: "Gasohol E85", price: 36.94),
                      FuelPriceWidget(text: "Gasohol E20", price: 34.34),
                      FuelPriceWidget(text: "Diesel", price: 34.44),
                      FuelPriceWidget(text: "Diesel B7", price: 34.44),
                      FuelPriceWidget(text: "Diesel B20", price: 34.44),
                      FuelPriceWidget(text: "Diesel Premium", price: 45.34),
                    ],
                  ),),
                ],
              ),
            ),
            SizedBox(height: 23),


            Container(),
            Container(),

          ],
        ),
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
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        iconSize: 35,
        activeIndex: _bottomNavIndex,

        activeColor: blackColor,
        inactiveColor: greyColor,

        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        onTap: (index) => _navigation(index),
      ),

    );
  }
}


// Navigator.pushNamed(context, '/login');