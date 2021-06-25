import 'package:flutter/material.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';

class GenericListTileCategory extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData iconData;
  final VoidCallback onTap;

  const GenericListTileCategory(
      {Key? key,
      required this.title,
      this.subtitle,
      required this.iconData,
      required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: Theme.of(context).appBarTheme.backgroundColor,
      leading: CircleAvatar(
        backgroundColor:
            Theme.of(context).secondaryHeaderColor.withOpacity(0.2),
        child: Center(
          child: Icon(
            iconData,
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
      ),
      title: Text(
        title,
        style: AppFont.font(
            TextStyle(color: Theme.of(context).textTheme.headline1!.color)),
      ),
      subtitle: (subtitle != null)
          ? Text(
              subtitle!,
              style: AppFont.font(TextStyle(
                  color: Theme.of(context).textTheme.headline2!.color)),
            )
          : null,
    );
  }
}
