import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pumppal/screens/login_screen.dart';
import 'package:pumppal/screens/signup_screen.dart';
import 'addCar.dart';
import 'package:pumppal/screens/get_started_screen.dart';
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
      initialRoute: '/login',
      routes: {
        '/': (context) => const AddCar(),
        '/login': (context) => LogInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/getStarted': (context) => GetStartedScreen(),
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