import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pumppal/constantPreset.dart';
import 'package:pumppal/widgets/button_widget.dart';
import 'package:pumppal/widgets/logo_widget.dart';
import 'package:pumppal/widgets/textfield_widget.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late FirebaseAuth _auth;
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  void initFirebase() async {
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: gradientBg,
        child: Column(
          children: [
            SizedBox(height: 100,),
            Container(
              child:Center(
                child: LogoWidget(height: 168, width: 167),
              ),
            ),

            SizedBox(height: 15,),
            Container(child: const Center(
              child: Text(
                "PumpPal",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,),),
            ),
            ),
            SizedBox(height: 15,),
            // Container(child: Center(
            //   child: TextFieldWidget( text: "Email", icon: Icons.email , isPasswordType: false , controller:_emailController,),
            //
            // ),),
            Container(child: Padding(
              padding: const EdgeInsets.only(left: 40, top:40, right: 40),
              child: Column(
                children: <Widget>[
                  TextFieldWidget(text: "Email", icon: Icons.email, isPasswordType: false, controller: _emailController),
                  SizedBox(height: 30,),
                  TextFieldWidget(text: "Password", icon: Icons.lock, isPasswordType: true, controller: _passwordController),
                  SizedBox(height: 30,),
                  TextFieldWidget(text: "Confirm password", icon: Icons.lock, isPasswordType: true, controller: _confirmPasswordController)
                ],
              ),
            ),
            ),

            SizedBox(height: 60,),
           Container(
             child: ButtonWidget(
               theChild: Container(
                 width: 312.0,
                 height: 64.0,
                 child: const Center(
                   child: Text(
                     "Sign up",
                     style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                       fontFamily: 'montserrat',
                       color: blackColor,
                     ),
                   ),
                 ),
               ),
               theOnTapFunc: () async {
                 if (_passwordController.text == _confirmPasswordController.text){
                   email = _emailController.text;
                   password = _passwordController.text;
                   try {
                     final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                     Navigator.pushNamed(context, '/getStarted');
                   }
                   on FirebaseAuthException catch (e) {
                     print(e);
                   }
                 }
                 else{
                   print("Password and Confirm password are not matched");
                 }
                 _emailController.clear();
                 _passwordController.clear();
                 _confirmPasswordController.clear();
               },

             ),
           ),

            SizedBox(height: 15),
            signUpOption(),
          ],
        ),
      ),
    );
  }

  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?",
        style: TextStyle(color: whiteColor,fontSize: 20),),
        SizedBox(width: 10,),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, '/login');
          },
          child: const Text(
            "Log in",
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold,fontSize: 20),
          ),
        )
      ],
    );
  }
}


