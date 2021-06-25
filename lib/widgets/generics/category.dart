import 'package:flutter/material.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';

class GenericCategory extends StatelessWidget {
  final String? title;

  const GenericCategory({Key? key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title!.toUpperCase(),
      style: AppFont.font(TextStyle(
          color: Theme.of(context).secondaryHeaderColor,
          fontWeight: FontWeight.bold)),
    );
  }
}
