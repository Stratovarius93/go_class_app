import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/CRUDsignature/CRUDsignature_bloc.dart';
import 'package:go_class_app/bloc/roomClass/classroom_bloc.dart';
import 'package:go_class_app/models/room_model.dart';
import 'package:go_class_app/widgets/generics/bodyText.dart';
import 'package:go_class_app/widgets/generics/bottomButton.dart';
import 'package:go_class_app/widgets/generics/category.dart';
import 'package:go_class_app/widgets/generics/input.dart';
import 'package:go_class_app/widgets/generics/snackBar.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:ionicons/ionicons.dart';

String? _selectedRadioTile;
TypeDescription _type = TypeDescription.text;
String _url = '';
String _name = '';

class AddClassroomPage extends StatefulWidget {
  @override
  _AddClassroomPageState createState() => _AddClassroomPageState();
}

class _AddClassroomPageState extends State<AddClassroomPage> {
  @override
  void initState() {
    super.initState();
    _selectedRadioTile = 'Ninguno';
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
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            title: GenericBodyText(
              title: 'Crear aula',
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
                          title: 'Nombre',
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
                                return value!.isNotEmpty ? null : 'Campo vacío';
                              },
                              onChanged: (value) {
                                _name = value;
                              },
                              maxLength: 32,
                              hintText: 'Nombre del aula',
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 16,
                        ),
                        GenericCategory(
                          title: 'Descripción',
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        RadioListTile(
                          value: 'Ninguno',
                          groupValue: _selectedRadioTile,
                          title: Text(
                            'Ninguno',
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
                          value: 'Presencial',
                          groupValue: _selectedRadioTile,
                          title: Text(
                            'Presencial',
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
                          value: 'Online',
                          groupValue: _selectedRadioTile,
                          title: Text(
                            'Online',
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
                        (_selectedRadioTile == 'Online')
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
                                      if (_selectedRadioTile == 'Online') {
                                        return value!.isNotEmpty
                                            ? null
                                            : 'Campo vacío';
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
                            title: 'Guardar aula',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                if (_type == TypeDescription.text) {
                                  ClassroomModel _classroom = ClassroomModel(
                                      name: _name,
                                      description: _selectedRadioTile,
                                      type: _type);
                                  BlocProvider.of<ClassroomBloc>(context)
                                      .add(Addclassroom(_classroom));
                                  BlocProvider.of<CRUDsignatureBloc>(context)
                                      .add(CRUDAddRoom(_classroom));
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
                                  ClassroomModel _classroom2 = ClassroomModel(
                                      name: _name,
                                      description: _url,
                                      type: _type);
                                  BlocProvider.of<ClassroomBloc>(context)
                                      .add(Addclassroom(_classroom2));
                                  BlocProvider.of<CRUDsignatureBloc>(context)
                                      .add(CRUDAddRoom(_classroom2));
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
