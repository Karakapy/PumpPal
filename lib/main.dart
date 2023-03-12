import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:pumppal/screens/add_car_screen.dart';
import 'package:pumppal/screens/user_profile.dart';
import 'package:pumppal/screens/fuel_calculator_screen.dart';
import 'package:pumppal/screens/home_screen.dart';
import 'package:pumppal/screens/login_screen.dart';
import 'package:pumppal/screens/signup_screen.dart';
import 'package:pumppal/screens/get_started_screen.dart';


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
    return GetMaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/addCar': (context) => AddCarScreen(),
        // '/addCar1': (context) => const AddCar(),
        '/login': (context) => LogInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/getStarted': (context) => GetStartedScreen(),
        '/fuelCalculator': (context) => FuelCalculatorScreen(),
        '/profile': (context) => UserProfileScreen() ,
      },
    );
  }
}

