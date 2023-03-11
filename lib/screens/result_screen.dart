import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//https://pub.dev/packages/carbon_icons/install

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        padding: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 40,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      elevation: 0,
    ),
    );
  }
}
