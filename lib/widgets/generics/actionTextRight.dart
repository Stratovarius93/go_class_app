import 'package:flutter/material.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';

class GenericActionTextRight extends StatelessWidget {
  final String? title;

  const GenericActionTextRight({Key? key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title!.toUpperCase(),
        style: AppFont.font(TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 16)),
      ),
    );
  }
}
