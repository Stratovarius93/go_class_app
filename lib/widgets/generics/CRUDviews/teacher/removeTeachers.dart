import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/schedule/schedule_bloc.dart';
import 'package:go_class_app/bloc/teachers/teachers_bloc.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';

Future<void> showAlertTeacherRemove(
    BuildContext context, String name, int position) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Eliminar profesor',
          style: AppFont.fontTitleDialog(context),
        ),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: '¿Está seguro que desea eliminar a ',
                  style: AppFont.fontHeadline2(context)),
              TextSpan(
                  text: '$name', style: AppFont.fontHeadline2Bold(context)),
              TextSpan(text: '?', style: AppFont.fontHeadline2(context)),
            ]),
          )
        ]),
        actions: [
          TextButton(
            child: Text(
              'Cancelar'.toUpperCase(),
              style: AppFont.fontTextButton(context),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text(
              'Eliminar'.toUpperCase(),
              style: AppFont.fontTextButton(context),
            ),
            onPressed: () {
              BlocProvider.of<ScheduleBloc>(context)
                  .add(RemoveScheduleTeacher(position));
              BlocProvider.of<TeacherBloc>(context)
                  .add(RemoveTeacher(position));
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
