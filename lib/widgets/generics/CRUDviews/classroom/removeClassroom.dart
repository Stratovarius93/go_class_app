import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/roomClass/classroom_bloc.dart';
import 'package:go_class_app/models/classroom/room_model.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> showAlertclassroomRemove(
    BuildContext context, ClassroomModel classroom) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          '${AppLocalizations.of(context)!.removeAlert_classroomTitle}',
          style: AppFont.fontTitleDialog(context),
        ),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text:
                      '${AppLocalizations.of(context)!.removeAlert_classroomPart1} ',
                  style: AppFont.fontHeadline2(context)),
              TextSpan(
                  text: '${classroom.name}',
                  style: AppFont.fontHeadline2Bold(context)),
              TextSpan(text: '?', style: AppFont.fontHeadline2(context)),
            ]),
          )
        ]),
        actions: [
          TextButton(
            child: Text(
              '${AppLocalizations.of(context)!.buttonAlert_cancel}',
              style: AppFont.fontTextButton(context),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text(
              '${AppLocalizations.of(context)!.buttonAlert_remove}',
              style: AppFont.fontTextButton(context),
            ),
            onPressed: () {
              BlocProvider.of<ClassroomBloc>(context)
                  .add(Removeclassroom(classroom.id!));
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
