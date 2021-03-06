import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/CRUDsignature/CRUDsignature_bloc.dart';
import 'package:go_class_app/bloc/schedule/schedule_bloc.dart';
import 'package:go_class_app/bloc/weekDays/weekDays_bloc.dart';
import 'package:go_class_app/models/itemSchedule/itemSchedule_model.dart';
import 'package:go_class_app/widgets/generics/CRUDviews/schedule/addSchedule/pageRoomClass.dart';
import 'package:go_class_app/widgets/generics/bodyText.dart';
import 'package:go_class_app/widgets/generics/bottomButton.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'colorSignature.dart';
import 'dialogSignatureName.dart';
import 'dialogSignatureTime.dart';
import 'pageTeacher.dart';

class AddSchedulePage extends StatefulWidget {
  @override
  _AddSchedulePageState createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulePage> {
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
                  title: GenericBodyText(
                    title: '${AppLocalizations.of(context)!.addSchedule_title}',
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
                                '${AppLocalizations.of(context)!.addSchedule_button}',
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
                                    AddSchedule(
                                        _itemSchedule, state.currentDay));
                                BlocProvider.of<ScheduleBloc>(context)
                                    .add(SortScheduleList());
                                BlocProvider.of<CRUDsignatureBloc>(context)
                                    .add(CRUDclean());
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
