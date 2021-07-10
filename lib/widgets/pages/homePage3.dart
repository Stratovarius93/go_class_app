import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_class_app/data/store/mainState_store.dart';
import 'package:go_class_app/widgets/constants/colors.dart';
import 'package:go_class_app/widgets/constants/screenSize.dart';
import 'package:go_class_app/widgets/generics/background.dart';
import 'package:go_class_app/widgets/generics/title.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:ionicons/ionicons.dart';

class HomePage3 extends StatefulWidget {
  @override
  _HomePage3State createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Theme.of(context).primaryColor.withOpacity(0.5);
      }
      return Theme.of(context).primaryColor.withOpacity(0.2);
    }

    double _circleSize = 65.0;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Theme.of(context).brightness,
          statusBarIconBrightness: Theme.of(context).brightness),
      child: AnimatedTheme(
        duration: Duration(milliseconds: 500),
        data: Theme.of(context),
        curve: Curves.easeInOutExpo,
        child: Stack(
          children: [
            (Theme.of(context).scaffoldBackgroundColor ==
                    AppColorLight.scaffoldBackground)
                ? Background(
                    colorTopRight1: Color(0xFFC6D8D3).withOpacity(0.8),
                    colorTopRight2: Color(0xFFC6D8D3),
                    //colorBottomLeft1: Color(0xFFFBB5A4).withOpacity(0.8),
                    //colorBottomLeft2: Color(0xFFFBB5A4),
                    colorBottomLeft1: Colors.orangeAccent.withOpacity(0.4),
                    colorBottomLeft2: Colors.orange.withOpacity(0.3),
                  )
                : Container(),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: ListView(
                children: [
                  Icon(
                    Ionicons.color_palette_outline,
                    size: screenWidth(context) * 0.3,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: GenericTitle(
                      title: 'Apariencia',
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Selecciona un tema',
                      textAlign: TextAlign.center,
                      style: AppFont.font(TextStyle(
                          color: Theme.of(context).textTheme.headline2!.color,
                          fontSize: screenWidth(context) * 0.05,
                          fontWeight: FontWeight.w300)),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => AdaptiveTheme.of(context).setLight(),
                            child: Container(
                              height: _circleSize,
                              width: _circleSize,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: new Border.all(
                                    color:
                                        (AdaptiveTheme.of(context).mode.name ==
                                                'Light')
                                            ? Colors.orange
                                            : Colors.transparent,
                                    width: 4.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Claro',
                            style: AppFont.font(TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .color)),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => AdaptiveTheme.of(context).setSystem(),
                            child: Container(
                              height: _circleSize,
                              width: _circleSize,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: new Border.all(
                                    color:
                                        (AdaptiveTheme.of(context).mode.name ==
                                                'System')
                                            ? Colors.orange
                                            : Colors.transparent,
                                    width: 4.0),
                              ),
                              child: new Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                  ),
                                  ClipRect(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      widthFactor: 0.5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Sistema',
                            style: AppFont.font(TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .color)),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => AdaptiveTheme.of(context).setDark(),
                            child: Container(
                              height: _circleSize,
                              width: _circleSize,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                border: new Border.all(
                                    color:
                                        (AdaptiveTheme.of(context).mode.name ==
                                                'Dark')
                                            ? Colors.orange
                                            : Colors.transparent,
                                    width: 4.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Oscuro',
                            style: AppFont.font(TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .color)),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        highlightColor:
                            Theme.of(context).primaryColor.withOpacity(0.2),
                        overlayColor:
                            MaterialStateProperty.resolveWith(getColor),
                        onTap: () async {
                          await MainStateStore.instance.change(true);
                          Navigator.pushReplacementNamed(context, 'mainIndex');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16)),
                          padding: EdgeInsets.all(12),
                          width: screenWidth(context) * 0.3,
                          child: Center(
                            child: Text('Empezar',
                                textAlign: TextAlign.center,
                                style: AppFont.font(TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 18))),
                          ),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
