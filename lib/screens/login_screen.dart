import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pumppal/constantPreset.dart';
import 'package:pumppal/widgets/button_widget.dart';
import 'package:pumppal/widgets/logo_widget.dart';
import 'package:pumppal/widgets/textfield_widget.dart';
import 'package:pumppal/main.dart';

class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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

                ],
              ),
            ),
            ),

            SizedBox(height: 150,),
            Container(
              child: ButtonWidget(
                theChild: Container(
                  width: 312.0,
                  height: 64.0,
                  child: const Center(
                    child: Text(
                      "Log in",
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

                  email = _emailController.text;
                  password = _passwordController.text;
                  try {
                    final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if (user != null) {
                      print("$email is in.");
                      Navigator.pushNamed(context, '/home');
                    } else {
                      print("Login failed");
                      loginError(context);
                    }
                    // final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                  }
                  on FirebaseAuthException catch (e) {
                    print(e);
                  }

                  _emailController.clear();
                  _passwordController.clear();
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
        const Text("First time here?",
          style: TextStyle(
            fontFamily: 'Inter',
            color: Colors.white,
            fontSize: 20
          )),
        SizedBox(width: 10,),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/signup');

          },


          child: const Text(
            "Sign up",
            style: TextStyle(fontFamily:'Inter',color: primaryColor, fontWeight: FontWeight.bold,fontSize: 20),
          ),
        )
      ],
    );
  }
}

Widget loginError(BuildContext context) {
  return Container(
      child: Column(
          children: const [
            Text("Login failed", style: TextStyle(fontFamily: 'Inter', color: Colors.red, fontSize: 20),)
          ],
  )
  );
}


