import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pumppal/widgets/alert_dialog_widget.dart';
import '../constantPreset.dart';
import '../models/car_model.dart';
import '../screens/add_car_screen.dart';
import '../parser/car_name_parser.dart';
import '../screens/fuel_calculator_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


Widget buildButton(CarModel car, int index, int totalSize, BuildContext context, String email){

  return Dismissible(
      key: UniqueKey(), // provide a unique key for the widget
      direction: DismissDirection.endToStart, // swipe direction
      confirmDismiss: (direction) async {
        // show the delete confirmation dialog and wait for user response
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialogWidget(title: "Confirm Delete", body: "Are you sure to delete this car?",);
          },
        );
      },
      background: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.white],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ),
      onDismissed: (direction) async {

        final prefs = await SharedPreferences.getInstance();
        prefs.setString('car_${email}', "null");

        final userCarList = FirebaseFirestore.instance.collection('user_with_car').doc(email);

        userCarList.update({
          'car_lsit': FieldValue.arrayRemove([car.toJson()])
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
        child:ElevatedButton(
          onPressed: () async {
            print(car.model);
            print(car.make);
            print(car.makeYear);

            final prefs = await SharedPreferences.getInstance();
            prefs.setString('car_${email}', "null");
            await prefs.setString('car_${email}', json.encode(car.toJson()));

            Navigator.push(context,
                MaterialPageRoute(builder: (context) { return FuelCalculatorScreen(); }));
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
                            color: greyColor),
                        ),
                      ),
                    ],
                  ),
                  Image.network('https://cdn.imagin.studio/getImage?customer=thdaranthawornwattanapolcompany&make=${car.make}&modelFamily=${car.model}&modelYear=${car.makeYear}',
                  width: 220,
                    height: 220,
                    fit: BoxFit.fitWidth,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );

  // }

}
