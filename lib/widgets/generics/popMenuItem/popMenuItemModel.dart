import 'package:flutter/material.dart';

class PopupMenuItemModel {
  final String? title;
  final Icon? icon;
  final bool? visible;
  final VoidCallback? onTap;

  PopupMenuItemModel({this.onTap, this.title, this.icon, this.visible});
}
