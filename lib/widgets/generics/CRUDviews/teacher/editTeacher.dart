import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/teachers/teachers_bloc.dart';
import 'package:go_class_app/models/teacher/teacher_model.dart';
import 'package:go_class_app/widgets/generics/bodyText.dart';
import 'package:go_class_app/widgets/generics/bottomButton.dart';
import 'package:go_class_app/widgets/generics/category.dart';
import 'package:go_class_app/widgets/generics/input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';

String _name = '';
String? _lastName = '';
String? _phoneNumber = '';
TeacherModel _teacher = TeacherModel(name: '');
TextEditingController? _controllerName;
TextEditingController? _controllerLastName;
TextEditingController? _controllerPhoneNumber;

class EditTeacherPage extends StatefulWidget {
  final TeacherModel teacher;
  final int? position;

  const EditTeacherPage({Key? key, required this.teacher, this.position})
      : super(key: key);
  @override
  _EditTeacherPageState createState() => _EditTeacherPageState();
}

class _EditTeacherPageState extends State<EditTeacherPage> {
  @override
  void initState() {
    super.initState();
    _controllerName = TextEditingController(text: widget.teacher.name);
    _controllerLastName = TextEditingController(
        text: (widget.teacher.lastName != null) ? widget.teacher.lastName : '');
    _controllerPhoneNumber = TextEditingController(
        text: (widget.teacher.phoneNumber != null)
            ? widget.teacher.phoneNumber
            : '');
    _name = widget.teacher.name;
    _lastName =
        (widget.teacher.lastName != null) ? widget.teacher.lastName : '';
    _phoneNumber =
        (widget.teacher.phoneNumber != null) ? widget.teacher.phoneNumber : '';
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
              title: '${AppLocalizations.of(context)!.editTeacher_title}',
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
                              controller: _controllerName,
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
                              controller: _controllerLastName,
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
                              controller: _controllerPhoneNumber,
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
                              '${AppLocalizations.of(context)!.editTeacher_button}',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _teacher = TeacherModel(
                                  name: _name,
                                  lastName: _lastName,
                                  phoneNumber: _phoneNumber);
                              try {
                                BlocProvider.of<TeacherBloc>(context).add(
                                    EditTeacher(widget.teacher.id!, _teacher));
                                _name = '';
                                _lastName = '';
                                _phoneNumber = '';
                                Navigator.of(context).pop();
                              } catch (e) {
                                print('======== ERROR =======');
                                print('ERROR to EditTeacher');
                                print(e);
                                print('======== ERROR =======');
                              }
                            }
                          },
                        ),
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
