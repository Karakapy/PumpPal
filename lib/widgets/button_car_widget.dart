import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constantPreset.dart';
import '../models/car_model.dart';
import '../screens/add_car_screen.dart';
import '../parser/car_name_parser.dart';

Widget buildButton(CarModel car, int index, int totalSize, BuildContext context, String email){

  FirebaseAuth auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  final email = user?.email;

    return Dismissible(
      key: Key('uniqueKey'), // provide a unique key for the widget
      direction: DismissDirection.endToStart, // swipe direction
      onDismissed: (direction) async {
     
        final userCarList = FirebaseFirestore.instance.collection('user_with_car').doc(email);

        userCarList.update({
          'car_lsit': FieldValue.arrayRemove([car.toJson()])
        });


      },
      child: Container(
        margin: EdgeInsets.all(20),
        child:ElevatedButton(
          onPressed: (){
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: lightGreyColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19))),
          child: SizedBox(
            height: 115,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              // padding: EdgeInsets.all(15),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text("${carNameParser(car.make)} ", style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 20,
                            color: Colors.black
                        ),),
                      ),
                      Container(
                        child: Text("${car.model}", style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 20,
                            color: Colors.black
                        ),),
                      ),
                      Container(
                        child: Text("${car.makeYear.toInt()}",style: TextStyle(
                            fontFamily:"Inter",
                            fontSize: 20,
                            color: greyColor),),
                      ),
                    ],
                  ),
                  Image.asset('assets/defaultCarImage.png',
                    height: 960,
                    width:160.0,),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  // }

}
