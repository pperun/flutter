import 'package:flutter/material.dart';

class Swatches {
  static const lightSwatch = MaterialColor(
    0x44ffffff,
    {
      50: Color(0xff8ec7ff),
      100: Color(0xff78bcff), //light
      200: Color(0xff61b1ff),
      300: Color(0xff4aa6ff), 
      400: Color(0xff1e90ff), 
      500: Color(0xff1b81e5), 
      600: Color(0xff1873cc), 
      700: Color(0xff1564b2), //dark
      800: Color(0xff125699), 
      900: Color(0xff0f487f), 
    }
  );
  
   static const darkSwatch = MaterialColor(
    0x22ffffff,
    {
      50: Color(0xff000522),
      100: Color(0xff000522), //light
      200: Color(0xff000522),
      300: Color(0xff000522), 
      400: Color(0xff000522), 
      500: Color(0xff000522), 
      600: Color(0xff000522), 
      700: Color(0xff000522), //dark
      800: Color(0xff000522), 
      900: Color(0xff000522), 
    }
  );
}