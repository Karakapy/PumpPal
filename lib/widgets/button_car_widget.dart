import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constantPreset.dart';
import '../models/car_model.dart';
import '../screens/add_car_screen.dart';

Widget buildButton(CarModel car, int index, int totalSize, BuildContext context, String email){
  if(index < totalSize-1){
    return ElevatedButton(
      onPressed: (){},
      style: ElevatedButton.styleFrom(
          backgroundColor: lightGreyColor,
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19))),
      child: SizedBox(
        height: 115,
        child: Container(
          padding: EdgeInsets.only(top:20,bottom: 20),
          // padding: EdgeInsets.all(15),
          child: Wrap(
            children: [
              Column(
                children: [
                  Text("${car.make} ${car.model}", style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  Text("${car.makeYear.toInt()}",style: TextStyle(
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
  } else {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCarScreen(email!)));
      },
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
                children: const [
                  Icon(Icons.add_circle, color:greyColor2,size: 60),
                  Text("Add new car",style: TextStyle(
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
  }

}
