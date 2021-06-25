import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_class_app/widgets/generics/bodyText.dart';

class MainPage4Appearance extends StatefulWidget {
  @override
  _MainPage4AppearanceState createState() => _MainPage4AppearanceState();
}

class _MainPage4AppearanceState extends State<MainPage4Appearance> {
  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: Duration(milliseconds: 500),
      data: Theme.of(context),
      curve: Curves.easeInOutExpo,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Theme.of(context).appBarTheme.textTheme!.headline1!.color),
          brightness: Theme.of(context).appBarTheme.brightness,
          title: GenericBodyText(
            title: 'Tema',
            color: Theme.of(context).appBarTheme.textTheme!.headline1!.color,
          ),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        body: ListView(
          children: [
            ListTile(
              onTap: () => AdaptiveTheme.of(context).setLight(),
              title: GenericBodyText(
                title: 'Light',
                color: Theme.of(context).textTheme.headline1!.color,
              ),
              subtitle: GenericBodyText(
                title: (AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                        'LIGHT')
                    ? 'Por defecto'
                    : '',
                fontWeight: FontWeight.w300,
                color: Theme.of(context).textTheme.headline2!.color,
              ),
            ),
            ListTile(
              onTap: () => AdaptiveTheme.of(context).setDark(),
              title: GenericBodyText(
                title: 'Dark',
                color: Theme.of(context).textTheme.headline1!.color,
              ),
              subtitle: GenericBodyText(
                title: (AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                        'DARK')
                    ? 'Por defecto'
                    : '',
                fontWeight: FontWeight.w300,
                color: Theme.of(context).textTheme.headline2!.color,
              ),
            ),
            ListTile(
              onTap: () => AdaptiveTheme.of(context).setSystem(),
              title: GenericBodyText(
                title: 'Sistema',
                color: Theme.of(context).textTheme.headline1!.color,
              ),
              subtitle: GenericBodyText(
                title: (AdaptiveTheme.of(context).mode.name.toUpperCase() ==
                        'SYSTEM')
                    ? 'Por defecto'
                    : '',
                fontWeight: FontWeight.w300,
                color: Theme.of(context).textTheme.headline2!.color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
