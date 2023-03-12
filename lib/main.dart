import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pumppal/screens/add_car_screen.dart';
import 'package:pumppal/screens/user_profile.dart';
import 'package:pumppal/screens/fuel_calculator_screen.dart';
import 'package:pumppal/screens/home_screen.dart';
import 'package:pumppal/screens/login_screen.dart';
import 'package:pumppal/screens/signup_screen.dart';
import 'package:pumppal/screens/get_started_screen.dart';
import 'api/api_oil_price.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/addCar': (context) => AddCarScreen(),
        '/login': (context) => LogInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/getStarted': (context) => GetStartedScreen(),
        '/fuelCalculator': (context) => FuelCalculatorScreen(),
        '/profile': (context) => UserProfileScreen(),
      },
   );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:pumppal/screens/login_screen.dart';
// import 'package:pumppal/screens/signup_screen.dart';
// //import 'register_screen.dart';
//
// void main() => runApp(LeanChat());
//
// class LeanChat extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LogInScreen(),
//     );
//   }
// }