import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pumppal/constantPreset.dart';
import 'package:pumppal/widgets/fuel_price_widget.dart';
import 'package:intl/intl.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:pumppal/widgets/nav_bar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/api_oil_price.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedItemIndex = 0;

  List<IconData> iconList = [
    Icons.home_outlined,
    Icons.person_outline,
  ];

  int _bottomNavIndex = 0;

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

    String currentTime = DateFormat('dd/MM/yyyy kk:mm:ss').format(DateTime.now());

    void _refreshTime() {
      setState(() {
        currentTime = DateFormat('dd/MM/yyyy kk:mm:ss').format(DateTime.now());
      });
    }

    void _navigation(index){
      setState(() {
        _bottomNavIndex = index;
      });
      if (_bottomNavIndex==1){
        if(token != null){
          Navigator.pushNamed(context, '/profile');
        }else{
          Navigator.pushNamed(context, '/login');
        }
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: blackColor2,
      body: Container(
        decoration: const BoxDecoration(
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

                  //text
                  Padding(
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

                  // choosing fuel station
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

                  // fuel price list
                  Container(
                    height: 365,
                    child: FutureBuilder(
                      future: getOilPrice(),
                      builder: (context, snapshot) {
                         if(!snapshot.hasData){
                           return Lottie.asset(
                               'assets/animation/animation1.json',
                             height: 100,
                             width: 100
                           );
                         } else {
                           final oil = snapshot.data!;
                           return ListView.builder(
                               padding: EdgeInsets.only(top:10,bottom: 10),
                                itemCount: oil[_selectedItemIndex].length,
                               itemBuilder: (context, index){
                                 final each_oil = oil[_selectedItemIndex][index];
                                 return createOilList(each_oil);
                               }
                           );

                         }
                      },
                    ),
                  ),
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
          if (token != null){
            Navigator.pushNamed(context, '/fuelCalculator');
          }else{
            Navigator.pushNamed(context, '/login');
          }


        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavBarWidget(
        currentIndex: _bottomNavIndex,
        onTap:(index)=>_navigation(index),
      ),
    );
  }
}


// Navigator.pushNamed(context, '/login');