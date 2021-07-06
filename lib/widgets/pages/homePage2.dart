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
import 'package:ionicons/ionicons.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
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

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Theme.of(context).brightness,
          statusBarIconBrightness: Theme.of(context).brightness),
      child: AnimatedTheme(
        duration: Duration(milliseconds: 500),
        data: Theme.of(context),
        curve: Curves.easeInOutExpo,
        child: Stack(children: [
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
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Ionicons.person_circle_outline,
                  size: screenWidth(context) * 0.3,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                SizedBox(
                  height: 32,
                ),
                Center(
                  child: GenericTitle(
                    title: 'Empecemos',
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'No necesitamos tus datos, más que sólo un nombre para tu saludo',
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
                          textAlign: TextAlign.center,
                          validator: (String? value) {
                            return (value!.isNotEmpty) ? null : 'Campo vacío';
                          },
                          onChanged: (value) {
                            _name = value;
                          },
                          maxLength: 32,
                          hintText: 'Ej: Pedro',
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
                            overlayColor:
                                MaterialStateProperty.resolveWith(getColor),
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<NameBloc>(context)
                                    .add(AddName(_name));
                                await MainStateStore.instance.change(true);
                                Navigator.pushReplacementNamed(
                                    context, 'mainIndex');
                              }
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
                            ))
                      ])),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
