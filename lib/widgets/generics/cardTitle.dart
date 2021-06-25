import 'package:flutter/material.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';

class GenericCardTitle extends StatelessWidget {
  final String? title;

  const GenericCardTitle({Key? key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: AppFont.font(TextStyle(
          color: Theme.of(context).textTheme.headline3!.color,
          fontSize: 16,
          fontWeight: FontWeight.w400)),
    );
  }
}
