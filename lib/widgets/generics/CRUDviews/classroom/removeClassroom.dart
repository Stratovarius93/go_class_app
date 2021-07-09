import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/roomClass/classroom_bloc.dart';
import 'package:go_class_app/models/classroom/room_model.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';

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
          'Eliminar sala',
          style: AppFont.fontTitleDialog(context),
        ),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: '¿Está seguro que desea eliminar ',
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
