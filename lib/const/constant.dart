import 'package:flutter/material.dart';

int _orangePrimaryValue = 0xffec9126;
int _darkOrangeSecondaryValue = 0xffe75d0e;
int _greyScale = 0xff212121;

MaterialColor primaryOrange = MaterialColor(
  _orangePrimaryValue,
  <int, Color>{
    50:  const Color(0xfffdf4e9),
    100: const Color(0xfffbe9d4),
    200: const Color(0xfff9debe),
    300: const Color(0xfff7d3a8),
    400: const Color(0xfff6c893),
    500: const Color(0xfff4bd7d),
    600: const Color(0xfff2b267),
    700: const Color(0xfff0a751),
    800: const Color(0xffee9c3c),
    900: Color(_orangePrimaryValue),
    1000: const Color(0xffbd741e),
  }
);

MaterialColor secondaryOrange = MaterialColor(
  _darkOrangeSecondaryValue,
  <int, Color>{
    50:  const Color(0xffedf1ee),
    100: const Color(0xfffadfcf),
    200: const Color(0xfff8ceb7),
    300: const Color(0xfff5be9f),
    400: const Color(0xfff3ae87),
    500: const Color(0xfff19e6e),
    600: const Color(0xffee8e56),
    700: const Color(0xffec7d3e),
    800: const Color(0xffe96d26),
    900: Color(_darkOrangeSecondaryValue),
  }
);

MaterialColor grey = MaterialColor(
  _greyScale,
  <int, Color>{
    50:  const Color(0xfffafafa),
    100: const Color(0xfffafafa),
    200: const Color(0xffeeeeee),
    300: const Color(0xffe0e0e0),
    400: const Color(0xffbdbdbd),
    500: const Color(0xff9e9e9e),
    600: const Color(0xff757575),
    700: const Color(0xff616161),
    800: const Color(0xff424242),
    900: Color(_greyScale),
  }
);