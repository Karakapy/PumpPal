import 'package:flutter/material.dart';
import 'package:pumppal/constantPreset.dart';
import 'package:pumppal/widgets/button_widget.dart';

class AlertDialogWidget extends StatelessWidget {

  String title;
  String body;

  AlertDialogWidget({ required this.title,required this.body});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(24, 20, 24, 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text("${title}",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text("${body}",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget(
                theChild: Container(
                  width: 90.0,
                  height: 45.0,
                  child: const Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,

                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
                theOnTapFunc: () {
                  Navigator.of(context).pop(false);
                },
                color: greyColor,
              ),

              ButtonWidget(
                theChild: Container(
                  width: 90.0,
                  height: 45.0,
                  child: const Center(
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
                theOnTapFunc: () {
                  Navigator.of(context).pop(true);
                },
                color: redColor,
              ),

            ],
          ),
        ],
      ),
    );

  }
}