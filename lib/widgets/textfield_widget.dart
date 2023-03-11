import 'package:flutter/material.dart';
import 'package:pumppal/constantPreset.dart';

class TextFieldWidget extends StatefulWidget {
  String text;
  IconData icon;
  bool isPasswordType;
  TextEditingController controller;

  TextFieldWidget({
    required this.text,
    required this.icon,
    required this.isPasswordType,
    required this.controller,
  });

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPasswordType ? _obscureText : false,
      enableSuggestions: !widget.isPasswordType,
      autocorrect: !widget.isPasswordType,
      cursorColor: Colors.white,
      style: TextStyle(color: blackColor),
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.icon,
          color: greyColor,
        ),
        hintText: widget.text,
        hintStyle: TextStyle(color: greyColor, fontSize: 18),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: whiteColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
        suffixIcon: widget.isPasswordType
            ? IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: greyColor,
          ),
        )
            : null,
      ),
      keyboardType: widget.isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    );
  }
}
