import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/teachers/teachers_bloc.dart';
import 'package:go_class_app/models/teacher/teacher_model.dart';
import 'package:go_class_app/widgets/generics/CRUDviews/teacher/editTeacher.dart';
import 'package:go_class_app/widgets/generics/CRUDviews/teacher/removeTeachers.dart';
import 'package:go_class_app/widgets/generics/actionTextRight.dart';
import 'package:go_class_app/widgets/generics/addNewItem.dart';
import 'package:go_class_app/widgets/generics/card.dart';
import 'package:go_class_app/widgets/generics/popMenuItem/popMenuItem.dart';
import 'package:go_class_app/widgets/generics/popMenuItem/popMenuItemModel.dart';
import 'package:go_class_app/widgets/generics/snackBar.dart';
import 'package:go_class_app/widgets/generics/subtitle.dart';
import 'package:go_class_app/widgets/generics/title.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_class_app/widgets/utils/teacherUtils.dart';
import 'package:ionicons/ionicons.dart';

class MainPage3 extends StatefulWidget {
  final BuildContext? contextRoute;

  const MainPage3({Key? key, this.contextRoute}) : super(key: key);

  @override
  _MainPage3State createState() => _MainPage3State();
}

class _MainPage3State extends State<MainPage3> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Theme.of(context).appBarTheme.brightness,
          statusBarIconBrightness: Theme.of(context).appBarTheme.brightness),
      child: AnimatedTheme(
        duration: Duration(milliseconds: 500),
        data: Theme.of(context),
        curve: Curves.easeInOutExpo,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: GenericTitle(
                      title: AppLocalizations.of(context)!.mainPage3_title),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 0, bottom: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GenericSubtitle(
                            title: AppLocalizations.of(context)!
                                .mainPage3_listTeacher),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                widget.contextRoute!,
                                'mainPage3CreateTeacher',
                              );
                            },
                            child: GenericActionTextRight(
                                title:
                                    AppLocalizations.of(context)!.button_add),
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _Teachers(buildContext: widget.contextRoute!),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Teachers extends StatefulWidget {
  final BuildContext buildContext;

  const _Teachers({Key? key, required this.buildContext}) : super(key: key);
  @override
  __TeachersState createState() => __TeachersState();
}

class __TeachersState extends State<_Teachers> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TeacherBloc>(context).add(LoadTeacherList());
  }

  @override
  Widget build(BuildContext context) {
    final double _degrees = 15;
    return BlocBuilder<TeacherBloc, TeacherState>(builder: (context, state) {
      if (state.listTeachers.isNotEmpty) {
        return GenericCard(
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.listTeachers.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 16),
              leading: CircleAvatar(
                backgroundColor:
                    Theme.of(context).secondaryHeaderColor.withOpacity(0.2),
                child: Center(
                  child: Transform.rotate(
                    angle: _degrees * -math.pi / 180,
                    child: Text(
                      '${state.listTeachers[index].name[0]}',
                      style: AppFont.font(TextStyle(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: 26,
                          fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
              ),
              title: Text(
                '${state.listTeachers[index].name} ${state.listTeachers[index].lastName}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppFont.font(TextStyle(
                    color: Theme.of(context).textTheme.headline3!.color)),
              ),
              subtitle: (state.listTeachers[index].phoneNumber != null &&
                      state.listTeachers[index].phoneNumber!.length != 0)
                  ? Text(
                      '${state.listTeachers[index].phoneNumber}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppFont.font(TextStyle(
                          color: Theme.of(context).textTheme.headline2!.color)),
                    )
                  : Container(),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                (state.listTeachers[index].phoneNumber != null &&
                        state.listTeachers[index].phoneNumber!.length != 0)
                    ? IconButton(
                        onPressed: () {
                          teacherDial(state.listTeachers[index].phoneNumber!);
                        },
                        icon: Icon(
                          Ionicons.call_outline,
                          color: Theme.of(context).primaryColor,
                        ))
                    : Container(),
                GenericPopMenuItem(
                    popupMenuItemModelList:
                        _listOptions(context, state.listTeachers[index], index))
              ]),
            ),
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                indent: 16,
                endIndent: 16,
                height: 1,
                color: Colors.grey.withOpacity(0.5),
              );
            },
          ),
        );
      } else {
        return GenericAddNewItem(
            title: '${AppLocalizations.of(context)!.addNew}',
            onTap: () {
              Navigator.pushNamed(
                widget.buildContext,
                'mainPage3CreateTeacher',
              );
            },
            iconData: Ionicons.person_outline);
      }
    });
  }
}

List<PopupMenuItemModel> _listOptions(
    BuildContext context, TeacherModel teacher, int position) {
  List<PopupMenuItemModel> _list = [
    PopupMenuItemModel(
        title: '${AppLocalizations.of(context)!.popMenu_number}',
        icon: Icon(
          Ionicons.copy_outline,
          color: Theme.of(context).textTheme.headline1!.color,
        ),
        onTap: () {
          try {
            Clipboard.setData(ClipboardData(text: teacher.phoneNumber));

            SnackBar _snackBar = GenericSnackBar(
              context: context,
              content: '${AppLocalizations.of(context)!.snackBar_clipboard}',
            ).snackBar();

            ScaffoldMessenger.of(context).showSnackBar(_snackBar);
          } catch (e) {
            print(e);
          }
        },
        visible: (teacher.phoneNumber != null) ? true : false),
    PopupMenuItemModel(
      title: '${AppLocalizations.of(context)!.popMenu_edit}',
      icon: Icon(
        Ionicons.create_outline,
        color: Theme.of(context).textTheme.headline1!.color,
      ),
      onTap: () {
        //print('Editar');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditTeacherPage(
                      teacher: teacher,
                      position: position,
                    )));
      },
      visible: true,
    ),
    PopupMenuItemModel(
      title: '${AppLocalizations.of(context)!.popMenu_remove}',
      icon: Icon(
        Ionicons.trash_outline,
        color: Theme.of(context).textTheme.headline1!.color,
      ),
      onTap: () async {
        await showAlertTeacherRemove(
            context, '${teacher.name} ${teacher.lastName}', teacher.id!);
      },
      visible: true,
    ),
  ];
  List<PopupMenuItemModel> _list2 = [
    PopupMenuItemModel(
      title: '${AppLocalizations.of(context)!.popMenu_edit}',
      icon: Icon(
        Ionicons.create_outline,
        color: Theme.of(context).textTheme.headline1!.color,
      ),
      onTap: () {
        //print('Editar');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditTeacherPage(
                      teacher: teacher,
                      position: position,
                    )));
      },
      visible: true,
    ),
    PopupMenuItemModel(
      title: '${AppLocalizations.of(context)!.popMenu_remove}',
      icon: Icon(
        Ionicons.trash_outline,
        color: Theme.of(context).textTheme.headline1!.color,
      ),
      onTap: () async {
        await showAlertTeacherRemove(
            context, '${teacher.name} ${teacher.lastName}', teacher.id!);
      },
      visible: true,
    ),
  ];

  if (teacher.phoneNumber != null && teacher.phoneNumber!.length != 0) {
    return _list;
  } else {
    return _list2;
  }
}
