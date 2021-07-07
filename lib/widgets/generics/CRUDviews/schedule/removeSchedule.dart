import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/schedule/schedule_bloc.dart';
import 'package:go_class_app/models/itemSchedule_model.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';

Future<void> showAlertRemoveSchedule(BuildContext context, int position,
    int currentDay, ItemScheduleModel itemScheduleModel) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Eliminar asignatura',
          style: AppFont.fontTitleDialog(context),
        ),
        content: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: '¿Desea eliminar la asignatura ',
                style: AppFont.fontHeadline2(context)),
            TextSpan(
                text: '${itemScheduleModel.name!.name}',
                style: AppFont.fontHeadline2Bold(context)),
            TextSpan(text: '?', style: AppFont.fontHeadline2(context))
          ]),
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancelar'.toUpperCase(),
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
              'Aceptar'.toUpperCase(),
              style: AppFont.font(TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
              )),
            ),
            onPressed: () {
              BlocProvider.of<ScheduleBloc>(context)
                  .add(RemoveSchedule(position, currentDay));
              BlocProvider.of<ScheduleBloc>(context).add(UpdateScheduleStore());
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}
