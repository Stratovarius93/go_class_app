import 'package:flutter/material.dart';
import 'package:go_class_app/widgets/constants/screenSize.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';

class GenericSubtitle extends StatelessWidget {
  final String title;
  final Color? color;

  const GenericSubtitle({Key? key, required this.title, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppFont.font(TextStyle(
          color: color ?? Theme.of(context).textTheme.headline2!.color,
          fontSize: screenWidth(context) * 0.05,
          fontWeight: FontWeight.w300)),
    );
  }
}
