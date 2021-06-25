import 'package:flutter/material.dart';
import 'package:go_class_app/widgets/constants/screenSize.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';

class GenericTitle extends StatelessWidget {
  final String? title;

  const GenericTitle({Key? key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppFont.font(TextStyle(
          color: Theme.of(context).textTheme.headline1!.color,
          fontSize: screenWidth(context) * 0.1,
          fontWeight: FontWeight.w300)),
    );
  }
}
