import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/CRUDsignature/CRUDsignature_bloc.dart';
import 'package:go_class_app/bloc/schedule/schedule_bloc.dart';
import 'package:go_class_app/bloc/weekDays/weekDays_bloc.dart';
import 'package:go_class_app/models/itemSchedule/itemSchedule_model.dart';
import 'package:go_class_app/widgets/generics/bodyText.dart';
import 'package:go_class_app/widgets/generics/bottomButton.dart';
import 'package:go_class_app/widgets/generics/snackBar.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';

import 'addSchedule/colorSignature.dart';
import 'addSchedule/dialogSignatureName.dart';
import 'addSchedule/dialogSignatureTime.dart';
import 'addSchedule/pageRoomClass.dart';
import 'addSchedule/pageTeacher.dart';

class EditSchedulePage extends StatefulWidget {
  final int? position;

  const EditSchedulePage({Key? key, this.position}) : super(key: key);
  @override
  _EditSchedulePageState createState() => _EditSchedulePageState();
}

class _EditSchedulePageState extends State<EditSchedulePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CRUDsignatureBloc, CRUDsignatureState>(
      builder: (context, stateSignature) =>
          BlocBuilder<WeekDaysBloc, WeekDaysState>(
        builder: (context, state) {
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
                  iconTheme:
                      IconThemeData(color: Theme.of(context).primaryColor),
                  leading: IconButton(
                      onPressed: () {
                        BlocProvider.of<CRUDsignatureBloc>(context)
                            .add(CRUDclean());
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Ionicons.arrow_back,
                        color: Theme.of(context).primaryColor,
                      )),
                  title: GenericBodyText(
                    title:
                        '${AppLocalizations.of(context)!.editSchedule_title}',
                    color: Theme.of(context)
                        .appBarTheme
                        .textTheme!
                        .headline1!
                        .color,
                  ),
                  backgroundColor:
                      Theme.of(context).appBarTheme.backgroundColor,
                ),
                body: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AddSignatureName(),
                        SizedBox(
                          height: 16,
                        ),
                        const AddTeacherSignature(),
                        SizedBox(
                          height: 16,
                        ),
                        const AddclassroomSignature(),
                        SizedBox(
                          height: 16,
                        ),
                        const AddTimeSignature(),
                        SizedBox(
                          height: 16,
                        ),
                        const AddColorSignature(),
                        SizedBox(
                          height: 32,
                        ),
                        GenericBottomButton(
                            title:
                                '${AppLocalizations.of(context)!.editSchedule_button}',
                            onTap: () async {
                              if (stateSignature.signatureId != null) {
                                ItemScheduleModel _itemSchedule =
                                    ItemScheduleModel(
                                        idSignature: stateSignature.signatureId,
                                        timeIn: stateSignature.timeIn,
                                        timeOut: stateSignature.timeOut,
                                        color: stateSignature.color!,
                                        idTeacher: stateSignature.teacherId,
                                        idClassroom:
                                            stateSignature.classroomId);
                                BlocProvider.of<ScheduleBloc>(context).add(
                                    EditSchedule(widget.position, _itemSchedule,
                                        state.currentDay));
                                BlocProvider.of<ScheduleBloc>(context)
                                    .add(SortScheduleList());
                                BlocProvider.of<CRUDsignatureBloc>(context)
                                    .add(CRUDclean());
                                SnackBar _snackBar = GenericSnackBar(
                                        duration: Duration(milliseconds: 1500),
                                        color: Color(0xFF5a8896),
                                        context: context,
                                        content:
                                            '${AppLocalizations.of(context)!.snackBar_edit_schedule}')
                                    .snackBar();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(_snackBar);

                                Navigator.pop(context);
                              } else {
                                await _showAlert(
                                  context,
                                );
                              }
                            }),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Future<void> _showAlert(
  BuildContext context,
) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          '${AppLocalizations.of(context)!.addAlert_schedule_title}',
          style: AppFont.fontTitleDialog(context),
        ),
        content: Text(
            '${AppLocalizations.of(context)!.addAlert_schedule_part1}',
            style: AppFont.fontHeadline2(context)),
        actions: [
          TextButton(
            child: Text(
              '${AppLocalizations.of(context)!.buttonAlert_ok}',
              style: AppFont.font(TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
              )),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}
