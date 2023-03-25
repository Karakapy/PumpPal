import 'package:flutter/material.dart';
import 'package:pumppal/constantPreset.dart';
import 'package:pumppal/controllers/auth_controller.dart';
import 'package:pumppal/widgets/button_widget.dart';
import 'package:pumppal/widgets/logo_widget.dart';
import 'package:pumppal/widgets/textfield_widget.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: gradientBg,
        child: Column(
          children: [
            SizedBox(height: 70,),
            Container(child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/');
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 35,
                      color: primaryColor,

                    ),
                  ),
                ],
              ),
            ),),

            SizedBox(height: 15,),
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
            SizedBox(height: 5,),
            Container(child: Padding(
              padding: const EdgeInsets.only(left: 40, top:40, right: 40),
              child: Column(
                children: <Widget>[
                  TextFieldWidget(text: "Email", icon: Icons.email, isPasswordType: false, controller: authController.emailController),
                  SizedBox(height: 30,),
                  TextFieldWidget(text: "Password", icon: Icons.lock, isPasswordType: true, controller: authController.passwordController),
                  SizedBox(height: 30,),
                  TextFieldWidget(text: "Confirm password", icon: Icons.lock, isPasswordType: true, controller: authController.confirmPasswordController)
                ],
              ),
            ),
            ),

            SizedBox(height: 50,),
           Container(
             child: ButtonWidget(
               color: primaryColor,
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
               theOnTapFunc: ()  {
                 authController.signUp(context);
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


