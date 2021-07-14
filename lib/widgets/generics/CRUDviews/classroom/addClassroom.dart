import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/CRUDsignature/CRUDsignature_bloc.dart';
import 'package:go_class_app/bloc/roomClass/classroom_bloc.dart';
import 'package:go_class_app/models/classroom/room_model.dart';
import 'package:go_class_app/widgets/generics/bodyText.dart';
import 'package:go_class_app/widgets/generics/bottomButton.dart';
import 'package:go_class_app/widgets/generics/category.dart';
import 'package:go_class_app/widgets/generics/input.dart';
import 'package:go_class_app/widgets/generics/snackBar.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:min_id/min_id.dart';

TypeDescription _type = TypeDescription.text;
String _url = '';
String _name = '';
String? _selectedRadioTile;

class AddClassroomPage extends StatefulWidget {
  @override
  _AddClassroomPageState createState() => _AddClassroomPageState();
}

class _AddClassroomPageState extends State<AddClassroomPage> {
  @override
  void initState() {
    super.initState();
    _selectedRadioTile = 'ninguno';
  }

  //@override
  //void didChangeDependencies() {
  //Locale myLocale = Localizations.localeOf(context);
  //print('my locale ${myLocale}');
  //super.didChangeDependencies();
  //}

  setSelectedRadioTile(String? val) {
    setState(() {
      _selectedRadioTile = val;
    });
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: Duration(milliseconds: 500),
      data: Theme.of(context),
      curve: Curves.easeInOutExpo,
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            brightness: Theme.of(context).brightness,
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            title: GenericBodyText(
              title: '${AppLocalizations.of(context)!.addClassroom_title}',
              color: Theme.of(context).appBarTheme.textTheme!.headline1!.color,
            ),
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          ),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GenericCategory(
                          title:
                              '${AppLocalizations.of(context)!.addClassroom_name}',
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context)
                                .secondaryHeaderColor
                                .withOpacity(0.2),
                            child: Center(
                              child: Icon(
                                Ionicons.location_outline,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: GenericInput(
                              validator: (String? value) {
                                return value!.isNotEmpty
                                    ? null
                                    : '${AppLocalizations.of(context)!.inputValidator}';
                              },
                              onChanged: (value) {
                                _name = value;
                              },
                              maxLength: 32,
                              hintText:
                                  '${AppLocalizations.of(context)!.addClassroom_hintText1}',
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 16,
                        ),
                        GenericCategory(
                          title:
                              '${AppLocalizations.of(context)!.addClassroom_description}',
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        RadioListTile(
                          value: 'ninguno',
                          groupValue: _selectedRadioTile,
                          title: Text(
                            '${AppLocalizations.of(context)!.addClassroom_descriptionNone}',
                            style: AppFont.font(TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline1!.color,
                            )),
                          ),
                          onChanged: (dynamic val) {
                            setSelectedRadioTile(val);
                            _type = TypeDescription.text;
                          },
                          activeColor: Theme.of(context).primaryColor,
                        ),
                        RadioListTile(
                          value: 'presencial',
                          groupValue: _selectedRadioTile,
                          title: Text(
                            '${AppLocalizations.of(context)!.addClassroom_descriptionOnSite}',
                            style: AppFont.font(TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline1!.color,
                            )),
                          ),
                          onChanged: (dynamic val) {
                            setSelectedRadioTile(val);
                            _type = TypeDescription.text;
                          },
                          activeColor: Theme.of(context).primaryColor,
                        ),
                        RadioListTile(
                          value: 'online',
                          groupValue: _selectedRadioTile,
                          title: Text(
                            '${AppLocalizations.of(context)!.addClassroom_descriptionOnline}',
                            style: AppFont.font(TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline1!.color,
                            )),
                          ),
                          onChanged: (dynamic val) {
                            setSelectedRadioTile(val);
                            _type = TypeDescription.url;
                          },
                          activeColor: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        (_selectedRadioTile == 'online')
                            ? Row(children: [
                                CircleAvatar(
                                  backgroundColor: Theme.of(context)
                                      .secondaryHeaderColor
                                      .withOpacity(0.2),
                                  child: Center(
                                    child: Icon(
                                      Ionicons.globe_outline,
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: GenericInput(
                                    validator: (String? value) {
                                      if (_selectedRadioTile == 'online') {
                                        return value!.isNotEmpty
                                            ? null
                                            : '${AppLocalizations.of(context)!.inputValidator}';
                                      }
                                    },
                                    onChanged: (value) {
                                      _url = value;
                                    },
                                    maxLength: 250,
                                    hintText: 'https://www.example.com',
                                  ),
                                ),
                              ])
                            : Container(),
                        SizedBox(
                          height: 32,
                        ),
                        GenericBottomButton(
                            title:
                                '${AppLocalizations.of(context)!.addClassroom_button}',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                if (_type == TypeDescription.text) {
                                  final String id = MinId.getId();
                                  ClassroomModel _classroom = ClassroomModel(
                                      id: id,
                                      name: _name,
                                      description: _selectedRadioTile,
                                      type: _type);
                                  BlocProvider.of<ClassroomBloc>(context)
                                      .add(Addclassroom(_classroom));
                                  BlocProvider.of<CRUDsignatureBloc>(context)
                                      .add(CRUDAddRoom(_classroom.id!));
                                  SnackBar _snackBar = GenericSnackBar(
                                          context: context,
                                          content: 'Se agregó la sala $_name')
                                      .snackBar();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(_snackBar);
                                  _type = TypeDescription.text;
                                  _url = '';
                                  _name = '';
                                  Navigator.pop(context);
                                } else if (_type == TypeDescription.url) {
                                  final String id = MinId.getId();
                                  ClassroomModel _classroom2 = ClassroomModel(
                                      id: id,
                                      name: _name,
                                      description: _url,
                                      type: _type);
                                  BlocProvider.of<ClassroomBloc>(context)
                                      .add(Addclassroom(_classroom2));
                                  BlocProvider.of<CRUDsignatureBloc>(context)
                                      .add(CRUDAddRoom(_classroom2.id!));
                                  SnackBar _snackBar = GenericSnackBar(
                                          context: context,
                                          content: 'Se agregó la sala $_name')
                                      .snackBar();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(_snackBar);
                                  _type = TypeDescription.text;
                                  _url = '';
                                  _name = '';
                                  Navigator.pop(context);
                                }
                              }
                            }),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
