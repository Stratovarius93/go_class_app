import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/name/name_bloc.dart';
import 'package:go_class_app/data/store/mainState_store.dart';
import 'package:go_class_app/widgets/constants/colors.dart';
import 'package:go_class_app/widgets/constants/screenSize.dart';
import 'package:go_class_app/widgets/generics/background.dart';
import 'package:go_class_app/widgets/generics/input.dart';
import 'package:go_class_app/widgets/generics/title.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';

PageController? _pageController;
TextEditingController? _controller;

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
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

  @override
  Widget build(BuildContext context) {
    _controller = TextEditingController(text: '');
    _pageController = PageController(initialPage: 0);
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
            BlocBuilder<NameBloc, NameState>(builder: (context, state) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: PageView(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _Page1(
                      name: state.name,
                    ),
                    _Page2(
                      name: state.name,
                    ),
                    _Page3(
                      name: state.name,
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

class _Page1 extends StatelessWidget {
  final String? name;
  const _Page1({
    Key? key,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            '${AppLocalizations.of(context)!.homePage_page1_text1}',
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
                //Navigator.pushNamed(context, 'homePage2');
                if (name!.isNotEmpty) {
                  _controller = TextEditingController(text: name);
                }
                _pageController!.animateToPage(1,
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.easeOut);
              },
              icon: Icon(
                Ionicons.arrow_forward_outline,
                color: Theme.of(context).appBarTheme.backgroundColor,
              )),
        )
      ],
    );
  }
}

class _Page2 extends StatefulWidget {
  final String? name;

  const _Page2({Key? key, this.name}) : super(key: key);
  @override
  __Page2State createState() => __Page2State();
}

class __Page2State extends State<_Page2> {
  String _name = '';
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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

    if (widget.name!.isNotEmpty) {
      _controller = TextEditingController(text: widget.name);
    } else {
      _controller = TextEditingController(text: '');
    }
    return ListView(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  _pageController!.animateToPage(0,
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.easeOut);
                },
                icon: Icon(
                  Ionicons.arrow_back,
                  size: 28,
                  color: Theme.of(context).primaryColor,
                )),
          ),
        ),
        Icon(
          Ionicons.person_circle_outline,
          size: screenWidth(context) * 0.25,
          color: Theme.of(context).secondaryHeaderColor,
        ),
        SizedBox(
          height: 32,
        ),
        Center(
          child: GenericTitle(
            title: '${AppLocalizations.of(context)!.homePage_page2_text1}',
          ),
        ),
        SizedBox(
          height: 32,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            '${AppLocalizations.of(context)!.homePage_page2_text2}',
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Form(
              key: _formKey,
              child: Column(children: [
                GenericInput(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  validator: (String? value) {
                    return (value!.isNotEmpty)
                        ? null
                        : '${AppLocalizations.of(context)!.inputValidator}';
                  },
                  onChanged: (value) {
                    _name = value;
                  },
                  maxLength: 32,
                  hintText:
                      '${AppLocalizations.of(context)!.homePage_page2_hintText}',
                ),
                SizedBox(
                  height: 32,
                ),
                InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    highlightColor:
                        Theme.of(context).primaryColor.withOpacity(0.2),
                    overlayColor: MaterialStateProperty.resolveWith(getColor),
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        if (widget.name!.isEmpty) {
                          BlocProvider.of<NameBloc>(context)
                              .add(AddName(_name));
                          _pageController!.animateToPage(2,
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeOut);
                        } else {
                          BlocProvider.of<NameBloc>(context)
                              .add(ChangeName(_name));
                          _pageController!.animateToPage(2,
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeOut);
                        }
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16)),
                      padding: EdgeInsets.all(12),
                      width: screenWidth(context) * 0.3,
                      child: Center(
                        child: Text(
                            '${AppLocalizations.of(context)!.homePage_page2_button}',
                            textAlign: TextAlign.center,
                            style: AppFont.font(TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18))),
                      ),
                    ))
              ])),
        )
      ],
    );
  }
}

class _Page3 extends StatefulWidget {
  final String? name;

  const _Page3({Key? key, this.name}) : super(key: key);
  @override
  __Page3State createState() => __Page3State();
}

class __Page3State extends State<_Page3> {
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
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  if (widget.name!.isNotEmpty) {
                    _controller = TextEditingController(text: widget.name);
                  }
                  _pageController!.animateToPage(1,
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.easeOut);
                },
                icon: Icon(
                  Ionicons.arrow_back,
                  size: 28,
                  color: Theme.of(context).primaryColor,
                )),
          ),
        ),
        Icon(
          Ionicons.color_palette_outline,
          size: screenWidth(context) * 0.25,
          color: Theme.of(context).secondaryHeaderColor,
        ),
        SizedBox(
          height: 32,
        ),
        Center(
          child: GenericTitle(
            title: '${AppLocalizations.of(context)!.homePage_page3_text1}',
          ),
        ),
        SizedBox(
          height: 32,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            '${AppLocalizations.of(context)!.homePage_page3_text2}',
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
                              (AdaptiveTheme.of(context).mode.name == 'Light')
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
                  '${AppLocalizations.of(context)!.theme_light}',
                  style: AppFont.font(TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).textTheme.headline3!.color)),
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
                              (AdaptiveTheme.of(context).mode.name == 'System')
                                  ? Colors.orange
                                  : Colors.transparent,
                          width: 4.0),
                    ),
                    child: new Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        ),
                        ClipRect(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.5,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
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
                  '${AppLocalizations.of(context)!.theme_system}',
                  style: AppFont.font(TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).textTheme.headline3!.color)),
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
                          color: (AdaptiveTheme.of(context).mode.name == 'Dark')
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
                  '${AppLocalizations.of(context)!.theme_dark}',
                  style: AppFont.font(TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).textTheme.headline3!.color)),
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
              highlightColor: Theme.of(context).primaryColor.withOpacity(0.2),
              overlayColor: MaterialStateProperty.resolveWith(getColor),
              onTap: () async {
                await MainStateStore.instance.change(true);
                Navigator.pushReplacementNamed(context, 'mainIndex');
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.all(12),
                width: screenWidth(context) * 0.3,
                child: Center(
                  child: Text(
                      '${AppLocalizations.of(context)!.homePage_page3_button}',
                      textAlign: TextAlign.center,
                      style: AppFont.font(TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18))),
                ),
              )),
        )
      ],
    );
  }
}
