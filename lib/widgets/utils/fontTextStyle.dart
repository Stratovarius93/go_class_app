import 'package:flutter/material.dart';
import 'package:go_class_app/widgets/constants/fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont {
  AppFont._();
  static TextStyle font(TextStyle textStyle) =>
      GoogleFonts.getFont(fontApp, textStyle: textStyle);
  static TextStyle fontHeadline2(BuildContext context) => font(TextStyle(
      color: Theme.of(context).textTheme.headline2!.color, fontSize: 16));
  static TextStyle fontHeadline2Bold(BuildContext context) => font(TextStyle(
      color: Theme.of(context).textTheme.headline2!.color,
      fontSize: 16,
      fontWeight: FontWeight.w600));

  static TextStyle fontTextButton(BuildContext context) => font(TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w500));

  static TextStyle fontTitleDialog(BuildContext context) =>
      font(TextStyle(color: Theme.of(context).secondaryHeaderColor));
}
