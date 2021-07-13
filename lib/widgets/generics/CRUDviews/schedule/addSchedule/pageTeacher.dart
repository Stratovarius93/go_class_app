import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/CRUDsignature/CRUDsignature_bloc.dart';
import 'package:go_class_app/bloc/teachers/teachers_bloc.dart';
import 'package:go_class_app/widgets/constants/screenSize.dart';
import 'package:go_class_app/widgets/generics/category.dart';
import 'package:go_class_app/widgets/generics/listTileCategory.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:go_class_app/widgets/utils/teacherUtils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';

class AddTeacherSignature extends StatefulWidget {
  const AddTeacherSignature({Key? key}) : super(key: key);
  @override
  _AddTeacherSignatureState createState() => _AddTeacherSignatureState();
}

class _AddTeacherSignatureState extends State<AddTeacherSignature> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TeacherBloc>(context).add(LoadTeacherList());
  }

  @override
  Widget build(BuildContext context) {
    const EdgeInsets _padding =
        EdgeInsets.symmetric(vertical: 16, horizontal: 16);
    return BlocBuilder<TeacherBloc, TeacherState>(
        builder: (context, stateTeacher) =>
            BlocBuilder<CRUDsignatureBloc, CRUDsignatureState>(
              builder: (context, state) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: _padding,
                    child: GenericCategory(
                      title:
                          '${AppLocalizations.of(context)!.addSchedule_teacher}',
                    ),
                  ),
                  (stateTeacher.listTeachers.isNotEmpty)
                      ? GenericListTileCategory(
                          title:
                              '${AppLocalizations.of(context)!.addSchedule_teacher_part1}',
                          iconData: Ionicons.person_sharp,
                          onTap: () async {
                            await _showAlertTeacher(context);
                          },
                          subtitle: (state.teacherId != null &&
                                  state.teacherId!.length != 0)
                              ? '${teacherByID(id: state.teacherId, teacherList: stateTeacher.listTeachers).name} ${teacherByID(id: state.teacherId, teacherList: stateTeacher.listTeachers).lastName}'
                              : '${AppLocalizations.of(context)!.addClassroom_descriptionNone}',
                        )
                      : Container(),
                  GenericListTileCategory(
                      title:
                          '${AppLocalizations.of(context)!.addSchedule_teacher_part2}',
                      iconData: Ionicons.add,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          'mainPage3CreateTeacher',
                        );
                      }),
                ],
              ),
            ));
  }
}

Future<void> _showAlertTeacher(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(
              '${AppLocalizations.of(context)!.addSchedule_teacher_part1}',
              style: AppFont.fontTitleDialog(context),
            ),
            content: _ListView(),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    '${AppLocalizations.of(context)!.buttonAlert_ok}',
                    style: AppFont.font(
                        TextStyle(color: Theme.of(context).primaryColor)),
                  )),
            ],
          ));
}

class _ListView extends StatefulWidget {
  const _ListView({
    Key? key,
  }) : super(key: key);

  @override
  __ListViewState createState() => __ListViewState();
}

class __ListViewState extends State<_ListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TeacherBloc>(context).add(LoadTeacherList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CRUDsignatureBloc, CRUDsignatureState>(
      builder: (context, stateCRUDsignature) {
        return BlocBuilder<TeacherBloc, TeacherState>(
          builder: (context, state) {
            if (state.listTeachers.length > 0) {
              return Container(
                height: screenWidth(context) * 0.8,
                width: screenHeight(context) * 0.8,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.listTeachers.length,
                  itemBuilder: (context, index) => ListTile(
                    title: ListTile(
                      onTap: () {
                        BlocProvider.of<CRUDsignatureBloc>(context)
                            .add(CRUDAddTeacher(state.listTeachers[index].id!));
                      },
                      title: Text(
                        '${state.listTeachers[index].name} ${state.listTeachers[index].lastName}',
                        style: AppFont.font(TextStyle(
                            color:
                                Theme.of(context).textTheme.headline1!.color)),
                      ),
                      subtitle:
                          (state.listTeachers[index].phoneNumber!.isNotEmpty)
                              ? Text(
                                  state.listTeachers[index].phoneNumber!,
                                  style: AppFont.font(TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .color)),
                                )
                              : null,
                      trailing: (stateCRUDsignature.teacherId ==
                              state.listTeachers[index].id)
                          ? CircleAvatar(
                              backgroundColor: Theme.of(context)
                                  .secondaryHeaderColor
                                  .withOpacity(0.3),
                              child: Icon(
                                Ionicons.checkmark,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
