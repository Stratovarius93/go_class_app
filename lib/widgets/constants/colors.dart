import 'package:flutter/material.dart';

class AppColorLight {
  AppColorLight._();
//backgroundColor
  //static const Color scaffoldBackground = Color(0xFFEDEEEE);
  static const Color scaffoldBackground = Color(0xFFf2f2f7);
//prymary color
  //static const Color primary = Color(0xFFF0964F);
  //static const Color second = Color(0xFF609696);
  static const Color primary = Color(0xFFffb93e);
  static const Color second = Color(0xFF74acbe);
//AppBarTheme
  static const Color appBarBackground = Colors.white;
//bottomNavigationBarTheme
  static const Color bottomNavigationBarBackground = Colors.white;
  static const Color bottomNavigationBarSelectedIcon = primary;
  static const Color bottomNavigationBarUnselectedIcon = headline4;
//CardTheme
  static const Color card = Colors.white;
  static const Color cardShadow = Colors.grey;
//Text Theme
  static const Color headline1 = Color(0xFF0E0F29);
  static const Color headline2 = Colors.black;
  static const Color headline3 = Colors.black;
  static const Color headline4 = Color(0xFF74acbe);
  static const Color headline5 = Color(0xFF59656e);
  // TextField
  static Color? inputFocusColor = second.withOpacity(0.1);
  //SnackBar
  static const Color snackBarText = Colors.white;
  static const Color snackBarBackground = second;
  static const Color snackBarAction = Colors.amber;
  //Color list Schedule
  static const List<Color?> listSchedule = [
    primary,
    second,
    Color(0xFF82b378),
    Color(0xFF163560),
    Color(0xFFFCB5A3),
    Color(0xFFbc3f3f)
  ];
}

class AppColorDark {
  AppColorDark._();
//backgroundColor
  static const Color scaffoldBackground = Color(0xFF17172B);
//prymary color
  //static const Color primary = Color(0xFFF0964F);
  //static const Color second = Color(0xFF609696);
  static const Color primary = Color(0xFFffb93e);
  static const Color second = Color(0xFF74acbe);
//AppBarTheme
  static const Color appBarBackground = Color(0xFF343345);
//bottomNavigationBarTheme
  static const Color bottomNavigationBarBackground = Color(0xFF343345);
  static const Color bottomNavigationBarSelectedIcon = primary;
  static const Color bottomNavigationBarUnselectedIcon = headline4;
//CardTheme
  static const Color card = Colors.white12;
  static const Color cardShadow = Colors.transparent;
//Text Theme
  static const Color headline1 = Colors.white;
  static const Color headline2 = Colors.white60;
  static const Color headline3 = headline1;
  static const Color headline4 = Color(0xFF74acbe);
  static const Color headline5 = Colors.white60;
  // TextField
  static Color? inputFocusColor = Colors.blue[50]!.withOpacity(0.2);
  //SnackBar
  static const Color snackBarText = Colors.white;
  static const Color snackBarBackground = second;
  static const Color snackBarAction = Colors.amber;
  //Color list Schedule
  static const List<Color> listSchedule = [
    primary,
    second,
    Color(0xFF82b378),
    Color(0xFF163560),
    Color(0xFFFCB5A3),
    Color(0xFFbc3f3f)
  ];
}
