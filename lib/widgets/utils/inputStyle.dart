import 'package:flutter/material.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';

InputDecoration inputDecorationDialog(BuildContext context, String? hintText) =>
    InputDecoration(
        counterText: '',
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.all(8),
        hintText: hintText,
        hintStyle: AppFont.font(
            TextStyle(color: Theme.of(context).textTheme.headline2!.color)));
