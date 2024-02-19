import 'package:flutter/material.dart';
import 'package:pumppal/constantPreset.dart';

import '../screens/add_car_screen.dart';

class AddNewCarWidget extends StatelessWidget {

  String? email;

  AddNewCarWidget({ required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
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
            padding: EdgeInsets.all(10),
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
      ),
    );
  }
}