import 'package:flutter/material.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';

class GenericBodyText extends StatelessWidget {
  final String? title;
  final Color? color;
  final FontWeight? fontWeight;

  const GenericBodyText({Key? key, this.title, this.color, this.fontWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: AppFont.font(TextStyle(color: color, fontWeight: fontWeight)),
    );
  }
}
