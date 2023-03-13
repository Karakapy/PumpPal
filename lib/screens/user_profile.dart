import 'package:flutter/material.dart';
import 'package:pumppal/constantPreset.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:pumppal/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pumppal/screens/add_car_screen.dart';
import '../widgets/button_widget.dart';
import '../widgets/nav_bar_widget.dart';
import '../models/car_model.dart';
import '../controllers/car_list_controller.dart';
import '../widgets/button_car_widget.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  List<IconData> iconList = [
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

  FirebaseAuth? auth;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    final email = user?.email;

    AuthController authController = AuthController();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: [
                Container(
                    height: 370.0,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
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
                                  authController.logOut();
                                },
                                color: redColor,
                              ),
                            ),
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
                              '${email}',
                              style: const TextStyle(
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
                  child: FutureBuilder(
                    future: getCarModel(email!),
                    builder: (context, snapshot) {
                      if(!snapshot.hasData){
                        return Container();
                      } else {
                        final carList = snapshot.data!;
                        return ListView.builder(
                          itemCount: carList.length,
                          itemBuilder: (context, index){
                            final each_car = carList[index];
                            print(each_car.carName);
                            return buildButton(each_car);
                          },
                        );
                      }
                    },
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, '/addCar');
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCarScreen(email!)));
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
                              children: const [
                                Icon(Icons.add_circle, color:greyColor2,size: 60),
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
              ],
            ),
          ),
          )
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
