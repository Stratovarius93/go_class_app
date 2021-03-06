import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/CRUDsignature/CRUDsignature_bloc.dart';
import 'package:go_class_app/bloc/teachers/teachers_bloc.dart';
import 'package:go_class_app/models/teacher/teacher_model.dart';
import 'package:go_class_app/widgets/generics/bodyText.dart';
import 'package:go_class_app/widgets/generics/bottomButton.dart';
import 'package:go_class_app/widgets/generics/category.dart';
import 'package:go_class_app/widgets/generics/input.dart';
import 'package:go_class_app/widgets/generics/snackBar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:min_id/min_id.dart';

String _name = '';
String _lastName = '';
String _phoneNumber = '';
TeacherModel _teacher = TeacherModel(name: '');

class AddTeacherPage extends StatefulWidget {
  @override
  _AddTeacherPageState createState() => _AddTeacherPageState();
}

class _AddTeacherPageState extends State<AddTeacherPage> {
  @override
  void initState() {
    super.initState();
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
              title: '${AppLocalizations.of(context)!.addTeacher_title}',
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
                              '${AppLocalizations.of(context)!.addTeacher_name}',
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
                                Ionicons.person_outline,
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
                                  '${AppLocalizations.of(context)!.addTeacher_name}',
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: GenericInput(
                              onChanged: (value) {
                                _lastName = value;
                              },
                              maxLength: 32,
                              hintText:
                                  '${AppLocalizations.of(context)!.addTeacher_lastName}',
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 16,
                        ),
                        GenericCategory(
                          title:
                              '${AppLocalizations.of(context)!.addTeacher_phone}',
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
                                Ionicons.call_outline,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: GenericInput(
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {
                                _phoneNumber = value;
                              },
                              maxLength: 10,
                              hintText:
                                  '${AppLocalizations.of(context)!.addTeacher_hintText1}',
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 32,
                        ),
                        GenericBottomButton(
                            title:
                                '${AppLocalizations.of(context)!.addTeacher_button}',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                final String id = MinId.getId();
                                _teacher = TeacherModel(
                                    id: id,
                                    name: _name,
                                    lastName: _lastName,
                                    phoneNumber: _phoneNumber);
                                try {
                                  BlocProvider.of<TeacherBloc>(context)
                                      .add(AddTeacher(_teacher));
                                  BlocProvider.of<CRUDsignatureBloc>(context)
                                      .add(CRUDAddTeacher(_teacher.id!));
                                  SnackBar _snackBar = GenericSnackBar(
                                          context: context,
                                          content:
                                              'Se agreg?? profesor(a) $_name')
                                      .snackBar();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(_snackBar);
                                  _name = '';
                                  _lastName = '';
                                  _phoneNumber = '';
                                  Navigator.of(context).pop();
                                } catch (e) {
                                  print('======== ERROR =======');
                                  print('ERROR to AddTeacher');
                                  print(e);
                                  print('======== ERROR =======');
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
