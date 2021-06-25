import 'package:flutter/material.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';

class GenericCardSubtitle extends StatelessWidget {
  final String? title;

  const GenericCardSubtitle({Key? key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: AppFont.font(TextStyle(
          color: Theme.of(context).textTheme.headline2!.color,
          fontSize: 14,
          fontWeight: FontWeight.w400)),
    );
  }
}
