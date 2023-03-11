import 'package:flutter/material.dart';

class FuelPriceWidget extends StatelessWidget {
  // const FuelPriceWidget({Key? key}) : super(key: key);
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
