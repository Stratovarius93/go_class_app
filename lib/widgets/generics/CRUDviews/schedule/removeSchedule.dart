import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/schedule/schedule_bloc.dart';
import 'package:go_class_app/models/itemSchedule/itemSchedule_model.dart';
import 'package:go_class_app/models/signature/signature_model.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:go_class_app/widgets/utils/signatureUtils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> showAlertRemoveSchedule(
    BuildContext context,
    int position,
    int currentDay,
    ItemScheduleModel itemScheduleModel,
    List<SignatureModel> list) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          '${AppLocalizations.of(context)!.removeAlert_scheduleTitle}',
          style: AppFont.fontTitleDialog(context),
        ),
        content: RichText(
          text: TextSpan(children: [
            TextSpan(
                text:
                    '${AppLocalizations.of(context)!.removeAlert_schedulePart1} ',
                style: AppFont.fontHeadline2(context)),
            TextSpan(
                text:
                    '${signatureByID(id: itemScheduleModel.idSignature, signatureList: list).name}',
                style: AppFont.fontHeadline2Bold(context)),
            TextSpan(text: '?', style: AppFont.fontHeadline2(context))
          ]),
        ),
        actions: [
          TextButton(
            child: Text(
              '${AppLocalizations.of(context)!.buttonAlert_cancel}',
              style: AppFont.font(TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
              )),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: Text(
              '${AppLocalizations.of(context)!.buttonAlert_remove}',
              style: AppFont.font(TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
              )),
            ),
            onPressed: () {
              BlocProvider.of<ScheduleBloc>(context)
                  .add(RemoveSchedule(position, currentDay));
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}
