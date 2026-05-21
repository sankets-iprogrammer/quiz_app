import 'package:flutter/material.dart';

class ThemeUtils {
  static const Color bgBlueColor=  Color.fromARGB(255, 242, 244, 251);
  static const Color textDarkBlueColor=  Color(0xFF0B1C30);
  static const Color primaryBlueColor=  Color(0xFF0058BE);
  static const Color greyColor=  Color(0xFF727785);
  static const Color secondaryBlueColor=  Color(0xFFd3e4fe);
  static const Color bgMedium=  Color.fromARGB(255,217, 251, 241);
  static const Color bgEasy=  Color.fromARGB(255, 217, 228, 251);
  static const Color bgHard=  Color.fromARGB(255, 251, 227, 217);
  

  static const TextStyle h1Text= TextStyle(
    color: textDarkBlueColor,
    fontSize: 40,
    fontWeight: FontWeight.w900
  );
  static const TextStyle h2Text= TextStyle(
    color: primaryBlueColor,
    fontSize: 28,
    fontWeight: FontWeight.w900
  );
   static const TextStyle h3Text= TextStyle(
    color: textDarkBlueColor,
    fontSize: 24,
    fontWeight: FontWeight.w800
  );
  static const TextStyle h4Text= TextStyle(
    color: primaryBlueColor,
    fontSize: 15,
    fontWeight: FontWeight.w600
  );
  static const TextStyle b1Text= TextStyle(
    color: textDarkBlueColor,
    fontSize: 18,
    fontWeight: FontWeight.w500
  );
  static const TextStyle b2Text= TextStyle(
    color: greyColor,
    fontSize: 16,
    fontWeight: FontWeight.w800
  );
  static const TextStyle b3Text= TextStyle(
    color: Color.fromARGB(255, 49, 49, 49),
    fontSize: 11,
    fontWeight: FontWeight.w500
  );


}