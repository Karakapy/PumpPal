import 'package:flutter/material.dart';
import 'package:pumppal/constantPreset.dart';

class CarListWidget extends StatelessWidget {

  String? brand;
  String? model;
  String? year;

  CarListWidget({ required this.brand, required this.model,required this.year });

  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}