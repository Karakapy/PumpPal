import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constantPreset.dart';
import '../models/car_model.dart';
import '../screens/result_screen.dart';
import 'button_widget.dart';

class ResultWidget extends StatefulWidget {
  List<int> res;
  final String? type;


  ResultWidget({
    required this.res,
    required this.type,
  });

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    switch (widget.type) {
    //Tank calculator
      case "Tank":
        return Container(
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10,bottom: 10),
                        child:Text("TOTAL", style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 25,
                            color:whiteColor,
                            fontWeight: FontWeight.bold
                        ))
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 55,bottom: 10,),
                        child:Text("${widget.res[0]}", style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 23,
                          color:whiteColor,
                        ))
                    ),
                    Container(
                        padding: EdgeInsets.only(bottom: 10,right: 10),
                        child:Text("Baht", style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 23,
                          color:whiteColor,
                        ))
                    ),
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10,bottom: 10),
                        child:Text("Distance", style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 25,
                            color:whiteColor,
                            fontWeight: FontWeight.bold
                        ))
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 55,bottom: 10,),
                        child:Text("${widget.res[1]}", style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 23,
                          color:whiteColor,
                        ))
                    ),
                    Container(
                        padding: EdgeInsets.only(bottom: 10,right: 10),
                        child:Text("km", style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 23,
                          color:whiteColor,
                        ))
                    ),
                  ]
              ),
            ],
          ),
        );

    //distance calculator
      case "Distance":
        return Container(
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10,bottom: 10),
                        child:Text("TOTAL", style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 25,
                            color:whiteColor,
                            fontWeight: FontWeight.bold
                        ))
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 55,bottom: 10,),
                        child:Text("${widget.res[0]}", style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 23,
                          color:whiteColor,
                        ))
                    ),
                    Container(
                        padding: EdgeInsets.only(bottom: 10,right: 10),
                        child:Text("Baht", style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 23,
                          color:whiteColor,
                        ))
                    ),
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10,bottom: 10),
                        child:Text("Distance", style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 25,
                            color:whiteColor,
                            fontWeight: FontWeight.bold
                        ))
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 55,bottom: 10,),
                        child:Text("${widget.res[1]}", style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 23,
                          color:whiteColor,
                        ))
                    ),
                    Container(
                        padding: EdgeInsets.only(bottom: 10,right: 10),
                        child:Text("km", style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 23,
                          color:whiteColor,
                        ))
                    ),
                  ]
              ),
            ],
          ),
        );

    //Budget calculator
      default:
        return Container(
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10,bottom: 10),
                        child:Text("FUEL", style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 25,
                            color:whiteColor,
                            fontWeight: FontWeight.bold
                        ))
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 55,bottom: 10,),
                        child:Text("${widget.res[0]}", style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 23,
                          color:whiteColor,
                        ))
                    ),
                    Container(
                        padding: EdgeInsets.only(bottom: 10,right: 10),
                        child:Text("L", style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 23,
                          color:whiteColor,
                        ))
                    ),
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10,bottom: 10),
                        child:Text("Distance", style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 25,
                            color:whiteColor,
                            fontWeight: FontWeight.bold
                        ))
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 55,bottom: 10,),
                        child:Text("${widget.res[1]}", style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 23,
                          color:whiteColor,
                        ))
                    ),
                    Container(
                        padding: EdgeInsets.only(bottom: 10,right: 10),
                        child:Text("km", style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 23,
                          color:whiteColor,
                        ))
                    ),
                  ]
              ),
            ],
          ),
        );

    }
  }

}
