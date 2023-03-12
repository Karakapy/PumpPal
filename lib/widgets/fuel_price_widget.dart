import 'package:flutter/material.dart';
import '../models/oil_model.dart';

Widget createOilList(Oil oil) => Container(
  margin: EdgeInsets.only(left: 15, right: 15),
  child: Padding(
    padding: const EdgeInsets.all(10.5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Container(child: Text(oil.name,style: TextStyle(
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
//
// Widget buildOil(List<Oil> oil) => ListView.builder(
//     itemCount: oil.length,
//     itemBuilder: (context, index){
//       final each_oil = oil[index];
//       return createOilList(each_oil);
//
//     });


class FuelPriceWidget extends StatelessWidget {
  FuelPriceWidget({
    required this.text, required this.price
  });

  final String text;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Padding(
        padding: const EdgeInsets.all(10.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(child: Text(text,style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'
            ),)),
            Container(child: Text(price.toString(), style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'
            ),
            )),
          ],
        ),
      ),
    );
  }
}
