import 'package:flutter/material.dart';
import 'package:pumppal/constantPreset.dart';
import 'package:pumppal/widgets/button_widget.dart';
import 'package:pumppal/widgets/logo_widget.dart';

class GetStartedScreen extends StatefulWidget {
  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: gradientBg,
        child: Column(
          children: [
            SizedBox(height: 229,),
            Container(
              child:Center(
                child: LogoWidget(height: 212, width: 213),
              ),
            ),

            SizedBox(height: 15,),
            Container(child: const Center(
              child: Text(
                "PumpPal",
                style: TextStyle(
                  fontFamily: 'montserrat',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,),),
            ),
            ),
            SizedBox(height: 50,),
            Container(child: Text("Welcome", style: TextStyle(
              fontSize: 32,
              color: whiteColor,
            ),
            ),
            ),
            



            SizedBox(height: 100,),
            Container(
              child: ButtonWidget(
                theChild: Container(
                  width: 312.0,
                  height: 64.0,
                  child: const Center(
                    child: Text(
                      "Get started",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'montserrat',
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
                theOnTapFunc: () {
                  Navigator.pushNamed(context, '/');
                },

              ),
            ),

            SizedBox(height: 15),

          ],
        ),
      ),
    );
  }

}


