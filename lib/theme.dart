import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Colors.white,
        primary: Colors.black,
        secondary: Colors.white,
        tertiary: Colors.grey.shade500));

ThemeData darkmode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.light(
        background: Colors.grey.shade900,
        primary: Colors.white,
        secondary: Colors.black,
        tertiary: Colors.grey.shade200));
