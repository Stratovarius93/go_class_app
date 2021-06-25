import 'package:flutter/material.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';

class GenericSnackBar {
  final BuildContext context;
  final VoidCallback? onTap;
  final String content;
  final String? action;

  const GenericSnackBar(
      {required this.context,
      this.onTap,
      required this.content,
      this.action});
  SnackBar snackBar() {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Theme.of(context).snackBarTheme.backgroundColor,
      content: Text(
        content,
        style: AppFont.font(TextStyle(
            color: Theme.of(context).snackBarTheme.contentTextStyle!.color)),
      ),
      action: SnackBarAction(
        textColor: Theme.of(context).snackBarTheme.actionTextColor,
        label: action ?? ''.toUpperCase(),
        onPressed: onTap ?? () {},
      ),
    );
  }
}
