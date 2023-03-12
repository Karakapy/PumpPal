import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pumppal/screens/get_started_screen.dart';
import 'package:pumppal/screens/home_screen.dart';
import 'package:pumppal/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController  extends GetxController{

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String email = '';
  String password = '';

  Future<void> signUp()async{
    if (passwordController.text == confirmPasswordController.text){
      email = emailController.text;
      password = passwordController.text;
      try {
        final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        Get.to(GetStartedScreen());
      }
      on FirebaseAuthException catch (e) {
        print(e);
      }
    }
    else{
      print("Password and Confirm password are not matched");
    }
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  Future<void> logIn()async{
    email = emailController.text;
    password = passwordController.text;
    try {
      final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user', user.user!.uid);
        prefs.setBool("isLoggedIn",true);

        print(prefs.getString('user'));
        print(prefs.getBool("isLoggedIn"));
        print("$email is in.");
        Get.to(() => HomeScreen());

      } else {
        print("Login failed");
      }
    }
    on FirebaseAuthException catch (e) {
      print(e);
    }

    emailController.clear();
    passwordController.clear();

  }

  Future<void> logOut()async {
    print("$email is logging out.");
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    final beforeToken = prefs.getString('user');
    print('beforeToken: ${beforeToken}');
    prefs.clear();
    final afterToken = prefs.getString('user');
    print('afterToken: ${afterToken}');
    Get.offAll(HomeScreen());
  }

}