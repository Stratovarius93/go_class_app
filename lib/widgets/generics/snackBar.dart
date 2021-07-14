import 'package:flutter/material.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';

class GenericSnackBar {
  final BuildContext context;
  final VoidCallback? onTap;
  final String content;
  final String? action;
  final Duration? duration;
  final Color? color;

  const GenericSnackBar(
      {required this.context,
      this.onTap,
      required this.content,
      this.action,
      this.duration,
      this.color});
  SnackBar snackBar() {
    return SnackBar(
      duration: duration ?? Duration(milliseconds: 3000),
      behavior: SnackBarBehavior.floating,
      backgroundColor: color ?? Color(0xFF648a5c),
      content: Text(
        content,
        style: AppFont.font(TextStyle(
            color: Theme.of(context).snackBarTheme.contentTextStyle!.color,
            fontWeight: FontWeight.w600)),
      ),
      action: SnackBarAction(
        textColor: Theme.of(context).snackBarTheme.actionTextColor,
        label: action ?? ''.toUpperCase(),
        onPressed: onTap ?? () {},
      ),
    );
  }
}
