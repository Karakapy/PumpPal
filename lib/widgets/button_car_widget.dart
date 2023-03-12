import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constantPreset.dart';
import '../models/car_model.dart';

Widget buildButton(CarModel car) => ElevatedButton(
    onPressed: (){},
  style: ElevatedButton.styleFrom(
      backgroundColor: lightGreyColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19))),
  child: SizedBox(
    height: 115,
    child: Container(
      padding: EdgeInsets.all(15),
      child: Wrap(
        children: [
          Column(
            children: [
              Text("${car.make} ${car.model}"),
              Text("${car.makeYear}",style: TextStyle(
                  fontFamily:"Inter",
                  fontSize: 20,
                  color: Color(0xffC6C6C6)),),
            ],
          ),
          Image.asset('assets/defaultCarImage.png',
            height: 96,
            width:160.0,),
        ],
      ),
    ),
  ),
);