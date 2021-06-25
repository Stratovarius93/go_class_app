import 'package:flutter/material.dart';

class AppColorLight {
  AppColorLight._();
//backgroundColor
  static const Color scaffoldBackground = Color(0xFFEDEEEE);
//prymary color
  static const Color primary = Color(0xFFF0964F);
  static const Color second = Color(0xFF609696);
//AppBarTheme
  static const Color appBarBackground = Colors.white;
//bottomNavigationBarTheme
  static const Color bottomNavigationBarBackground = Colors.white;
  static const Color bottomNavigationBarSelectedIcon = primary;
  static const Color bottomNavigationBarUnselectedIcon = second;
//CardTheme
  static const Color card = Colors.white;
  static const Color cardShadow = Colors.grey;
//Text Theme
  static const Color headline1 = Color(0xFF0E0F29);
  static const Color headline2 = Colors.black;
  static const Color headline3 = Colors.black;
  //SnackBar
  static const Color snackBarText = Colors.white;
  static const Color snackBarBackground = second;
  static const Color snackBarAction = Colors.amber;
  //Color list Schedule
  static const List<Color?> listSchedule = [
    primary,
    second,
    Colors.amber,
    Color(0xFFb73a61),
    Color(0xFFFCB5A3),
    Color(0xFF0E0F29)
  ];
}

class AppColorDark {
  AppColorDark._();
//backgroundColor
  static const Color scaffoldBackground = Color(0xFF121212);
//prymary color
  static const Color primary = Color(0xFFF0964F);
  static const Color second = Color(0xFF609696);
//AppBarTheme
  static const Color appBarBackground = Color(0xFF242424);
//bottomNavigationBarTheme
  static const Color bottomNavigationBarBackground = Color(0xFF242424);
  static const Color bottomNavigationBarSelectedIcon = primary;
  static const Color bottomNavigationBarUnselectedIcon = second;
//CardTheme
  static const Color card = Colors.white24;
  static const Color cardShadow = Colors.transparent;
//Text Theme
  static const Color headline1 = Colors.white;
  static const Color headline2 = Colors.white60;
  static const Color headline3 = headline1;
  //SnackBar
  static const Color snackBarText = Colors.white;
  static const Color snackBarBackground = second;
  static const Color snackBarAction = Colors.amber;
  //Color list Schedule
  static const List<Color> listSchedule = [
    primary,
    second,
    Colors.amber,
    Color(0xFFb73a61),
    Color(0xFFFCB5A3),
    Color(0xFF0E0F29)
  ];
}
