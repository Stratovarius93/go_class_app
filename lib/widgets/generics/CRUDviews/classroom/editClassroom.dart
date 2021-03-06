import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/roomClass/classroom_bloc.dart';
import 'package:go_class_app/models/classroom/room_model.dart';
import 'package:go_class_app/widgets/generics/bodyText.dart';
import 'package:go_class_app/widgets/generics/bottomButton.dart';
import 'package:go_class_app/widgets/generics/category.dart';
import 'package:go_class_app/widgets/generics/input.dart';
import 'package:go_class_app/widgets/generics/snackBar.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';

String? _selectedRadioTile;
TypeDescription _type = TypeDescription.text;
String? _url = '';
String _name = '';
TextEditingController? _controller;
TextEditingController? _controllerURL;

class EditclassroomPage extends StatefulWidget {
  final ClassroomModel classroom;

  const EditclassroomPage({Key? key, required this.classroom})
      : super(key: key);
  @override
  _EditclassroomPageState createState() => _EditclassroomPageState();
}

class _EditclassroomPageState extends State<EditclassroomPage> {
  @override
  void initState() {
    super.initState();
    _selectedRadioTile = (widget.classroom.type == TypeDescription.text)
        ? widget.classroom.description
        : 'online';
    _name = widget.classroom.name;
    _type = widget.classroom.type;
    _url = (widget.classroom.type == TypeDescription.text)
        ? ''
        : widget.classroom.description;
    _controller = TextEditingController(text: widget.classroom.name);
    _controllerURL = TextEditingController(
        text: (widget.classroom.type == TypeDescription.text)
            ? ''
            : widget.classroom.description);
  }

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
              title: '${AppLocalizations.of(context)!.editClassroom_title}',
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
                              controller: _controller,
                              //controller: TextEditingController(
                              //text: widget.classroom.name),
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
                            _url = val;
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
                            _url = val;
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
                            _url = val;
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
                                    controller: _controllerURL,
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
                                    maxLength: 128,
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
                                '${AppLocalizations.of(context)!.editClassroom_button}',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                if (_type == TypeDescription.text) {
                                  ClassroomModel _classroom = ClassroomModel(
                                      name: _name,
                                      description: _url,
                                      type: _type);
                                  BlocProvider.of<ClassroomBloc>(context).add(
                                      Editclassroom(
                                          widget.classroom.id!, _classroom));
                                  _type = TypeDescription.text;
                                  _url = '';
                                  _name = '';
                                  Navigator.pop(context);
                                } else if (_type == TypeDescription.url) {
                                  ClassroomModel _classroom2 = ClassroomModel(
                                      name: _name,
                                      description: _url,
                                      type: _type);
                                  BlocProvider.of<ClassroomBloc>(context).add(
                                      Editclassroom(
                                          widget.classroom.id!, _classroom2));
                                  _type = TypeDescription.text;
                                  _url = '';
                                  _name = '';
                                  SnackBar _snackBar = GenericSnackBar(
                                          duration:
                                              Duration(milliseconds: 1500),
                                          color: Color(0xFF5a8896),
                                          context: context,
                                          content:
                                              '${AppLocalizations.of(context)!.snackBar_edit_classroom}')
                                      .snackBar();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(_snackBar);

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
