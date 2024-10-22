import 'package:flutter/material.dart';
import 'package:tp1_2/constant/myColors.dart';

ThemeData LightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: backGround,
    primary: myBlue,
    secondary: const Color.fromARGB(255, 255, 255, 255),
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade900,
  ), // ColorScheme.light
);
