import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_class_app/widgets/constants/colors.dart';
import 'package:go_class_app/widgets/constants/screenSize.dart';
import 'package:go_class_app/widgets/generics/background.dart';
import 'package:go_class_app/widgets/generics/title.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:ionicons/ionicons.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
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
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Ionicons.calendar_outline,
                    size: screenWidth(context) * 0.3,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: GenericTitle(
                      title: 'Go Class',
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Organiza tus clases de una mejor manera',
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
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 32,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'homePage2');
                        },
                        icon: Icon(
                          Ionicons.arrow_forward_outline,
                          color: Theme.of(context).appBarTheme.backgroundColor,
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
