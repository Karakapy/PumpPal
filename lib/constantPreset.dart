import 'package:flutter/material.dart';

const primaryColor = Color(0xffffde59);
const blackColor = Color(0xFF1F1F1F);
const unavailableColor = Color(0xffBDC2B9);
const greyColor = Color(0xff848484);
const lightGreyColor = Color(0xffF3F3F3);

// gradient background
const greyBlueColor = Color(0xff637E96);
const blackColor2 = Color(0xFF000000);

const whiteColor = Color(0xFFFFFFFF);

const buttonFont = TextStyle(fontFamily: 'Inter', fontSize: 20);
const calculateFont = TextStyle(fontFamily: 'Montserrat', fontWeight:FontWeight.bold,fontSize: 16);

const gradientBg = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        greyBlueColor,
        blackColor2,
      ],
    )
);

const redColor = Color(0xFFFF4242);
const greyColor2 = Color(0xffC6C6C6);
