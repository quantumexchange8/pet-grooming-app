import 'package:adoptify/const/constant.dart';
import 'package:flutter/material.dart';


ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Colors.black,
    secondary: grey.shade200.withOpacity(0.5), //text field
    tertiary: primaryOrange.shade100, //button for light orange
    background: Colors.white,
    primaryContainer: Color(0xFFF5F5F5),
    secondaryContainer: Colors.white,
    onSecondary: grey.shade700,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Colors.white,
    secondary: grey.shade900, //text field
    tertiary: grey.shade800, //button for light orange
    background: Colors.black,
    primaryContainer: Colors.black,
    secondaryContainer:Color(0xFF181A20),
    onSecondary: grey.shade200,
    
  ),
);