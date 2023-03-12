import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:pumppal/screens/add_car_screen.dart';
import 'package:pumppal/screens/user_profile.dart';
import 'package:pumppal/screens/fuel_calculator_screen.dart';
import 'package:pumppal/screens/home_screen.dart';
import 'package:pumppal/screens/login_screen.dart';
import 'package:pumppal/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pumppal/screens/get_started_screen.dart';
import 'api/api_oil_price.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  try{} catch(e){
    print('Init failed' + e.toString());
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.hasData) {
          final SharedPreferences prefs = snapshot.data!;
          final token = prefs.getString('user');
          return GetMaterialApp(
            initialRoute: '/',
            getPages: [
              GetPage(name: '/', page: () => HomeScreen()),
              GetPage(name: '/addCar', page: () => AddCarScreen()),
              GetPage(name: '/login', page: () => LogInScreen()),
              GetPage(name: '/signup', page: () => SignUpScreen()),
              GetPage(name: '/getStarted', page: () => GetStartedScreen()),
              GetPage(name: '/fuelCalculator', page: () => token != null ? FuelCalculatorScreen() : LogInScreen()),
              GetPage(name: '/profile', page: () => token != null ? UserProfileScreen() : LogInScreen()),
            ],
            // routes: {
            //   '/': (context) => HomeScreen(),
            //   '/addCar': (context) => AddCarScreen(),
            //   '/addCar1': (context) => const AddCar(),
            //   '/login': (context) => LogInScreen(),
            //   '/signup': (context) => SignUpScreen(),
            //   '/getStarted': (context) => GetStartedScreen(),
            //   '/fuelCalculator': (context) => token != null ? FuelCalculatorScreen() : LogInScreen(),
            //   '/profile': (context) => token != null ? UserProfileScreen() : LogInScreen(),
            // },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

