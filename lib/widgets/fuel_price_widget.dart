import 'package:flutter/material.dart';
import '../models/oil_model.dart';
import '../parser/oil_name_parser.dart';

Widget createOilList(Oil oil) => Container(
  padding: EdgeInsets.only(left: 15, right: 15),
  child: Padding(
    padding: const EdgeInsets.all(10.5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Container(child: Text(oilNameParser(oil.name).toString(),style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat'
        ),)),
        Container(child: Text(oil.price.toString(), style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat'
        ),
        )),
      ],
    ),
  ),
);


