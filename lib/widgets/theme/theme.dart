import 'package:flutter/material.dart';
import 'package:go_class_app/widgets/constants/colors.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
      colorScheme: ColorScheme.light(
        primary: AppColorLight.primary,
        primaryVariant: Color(0xFFe3704d),
        secondary: AppColorLight.second,
        secondaryVariant: Color(0xFF394e54),
      ),
      accentColor: Colors.orange,
      dialogBackgroundColor: AppColorLight.bottomNavigationBarBackground,
      textSelectionTheme:
          TextSelectionThemeData(selectionHandleColor: AppColorLight.primary),
      primaryColor: AppColorLight.primary,
      secondaryHeaderColor: AppColorLight.second,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColorLight.scaffoldBackground,
      appBarTheme: AppBarTheme(
          textTheme:
              TextTheme(headline1: TextStyle(color: AppColorLight.headline1)),
          backgroundColor: AppColorLight.appBarBackground,
          brightness: Brightness.dark),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColorLight.bottomNavigationBarBackground,
          selectedItemColor: AppColorLight.bottomNavigationBarSelectedIcon,
          unselectedItemColor: AppColorLight.bottomNavigationBarUnselectedIcon),
      textTheme: TextTheme(
          headline1: TextStyle(color: AppColorLight.headline1),
          headline2: TextStyle(color: AppColorLight.headline2.withOpacity(0.5)),
          headline3: TextStyle(color: AppColorLight.headline3),
          headline4: TextStyle(color: AppColorLight.headline4),
          headline5: TextStyle(color: AppColorLight.headline5)),
      inputDecorationTheme:
          InputDecorationTheme(focusColor: AppColorLight.inputFocusColor),
      cardTheme: CardTheme(
          color: AppColorLight.card,
          shadowColor: AppColorLight.cardShadow.withOpacity(0.3)),
      snackBarTheme: SnackBarThemeData(
          actionTextColor: AppColorDark.snackBarAction,
          backgroundColor: AppColorLight.snackBarBackground,
          contentTextStyle: TextStyle(color: AppColorLight.snackBarText)),
      timePickerTheme: TimePickerThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))));
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
      colorScheme: ColorScheme.dark(
        primary: AppColorLight.primary,
        primaryVariant: Color(0xFFe3704d),
        secondary: AppColorLight.second,
        secondaryVariant: Color(0xFF394e54),
      ),
      accentColor: Colors.orange,
      dialogBackgroundColor: AppColorDark.bottomNavigationBarBackground,
      textSelectionTheme:
          TextSelectionThemeData(selectionHandleColor: AppColorDark.primary),
      primaryColor: AppColorDark.primary,
      secondaryHeaderColor: AppColorDark.second,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColorDark.scaffoldBackground,
      appBarTheme: AppBarTheme(
          textTheme:
              TextTheme(headline1: TextStyle(color: AppColorDark.headline1)),
          backgroundColor: AppColorDark.appBarBackground,
          brightness: Brightness.light),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColorDark.bottomNavigationBarBackground,
          selectedItemColor: AppColorDark.bottomNavigationBarSelectedIcon,
          unselectedItemColor: AppColorDark.bottomNavigationBarUnselectedIcon),
      textTheme: TextTheme(
          headline1: TextStyle(color: AppColorDark.headline1),
          headline2: TextStyle(color: AppColorDark.headline2),
          headline3: TextStyle(color: AppColorDark.headline3),
          headline4: TextStyle(color: AppColorDark.headline4),
          headline5: TextStyle(color: AppColorDark.headline5)),
      inputDecorationTheme:
          InputDecorationTheme(focusColor: AppColorDark.inputFocusColor),
      cardTheme: CardTheme(
          color: AppColorDark.card, shadowColor: AppColorDark.cardShadow),
      snackBarTheme: SnackBarThemeData(
          actionTextColor: AppColorDark.snackBarAction,
          backgroundColor: AppColorDark.snackBarBackground,
          contentTextStyle: TextStyle(color: AppColorDark.snackBarText)),
      timePickerTheme: TimePickerThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))));
}
