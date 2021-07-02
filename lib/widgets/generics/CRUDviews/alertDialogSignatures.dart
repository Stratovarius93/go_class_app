import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/CRUDsignature/CRUDsignature_bloc.dart';
import 'package:go_class_app/bloc/schedule/schedule_bloc.dart';
import 'package:go_class_app/bloc/signatures/signatures_bloc.dart';
import 'package:go_class_app/models/signature_model.dart';
import 'package:go_class_app/widgets/generics/input.dart';
import 'package:go_class_app/widgets/generics/snackBar.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';

Future<void> showAlertSignatureEdit(
    BuildContext context,
    SignatureModel signature,
    int position,
    GlobalKey<FormState> formKey) async {
  return await showDialog(
    context: context,
    builder: (context) {
      String _newValueAdd = signature.name;
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Editar asignatura',
          style: AppFont.fontTitleDialog(context),
        ),
        content: Form(
          key: formKey,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(
              'Ingresa el nuevo nombre de la asignatura:',
              style: AppFont.fontHeadline2(context),
            ),
            SizedBox(
              height: 16,
            ),
            GenericInput(
              controller: TextEditingController(text: signature.name),
              autofocus: true,
              validator: (String? value) {
                return value!.isNotEmpty ? null : 'Campo vacío';
              },
              onChanged: (value) {
                _newValueAdd = value;
              },
              maxLength: 32,
              hintText: 'Nombre de la asignatura',
            ),
          ]),
        ),
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
              'Actualizar'.toUpperCase(),
              style: AppFont.fontTextButton(context),
            ),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                SignatureModel _newSignature =
                    SignatureModel(name: _newValueAdd);
                BlocProvider.of<ScheduleBloc>(context)
                    .add(EditScheduleSignatureName(signature, _newSignature));
                BlocProvider.of<SignaturesBloc>(context)
                    .add(EditSignature(position, _newSignature));
                _newValueAdd = '';
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}

Future<void> showAlertSignatureRemove2(
    BuildContext context, String? name, int position) async {
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
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Existen asignaturas en el horario con el nombre ',
                  style: AppFont.fontHeadline2(context)),
              TextSpan(
                  text: '$name', style: AppFont.fontHeadline2Bold(context)),
              TextSpan(
                  text:
                      ', al eliminar borrarán las asignaturas del horario que contienen ese nombre.',
                  style: AppFont.fontHeadline2(context)),
              TextSpan(
                  text: '¿Está seguro que desea eliminar la asignatura?',
                  style: AppFont.fontHeadline2(context)),
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
                  .add(RemoveScheduleSignature(position));
              BlocProvider.of<SignaturesBloc>(context)
                  .add(RemoveSignature(position));
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> showAlertSignatureRemove(
    BuildContext context, String? name, int position) async {
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
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: '¿Está seguro que desea eliminar la asignatura de ',
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
              BlocProvider.of<SignaturesBloc>(context)
                  .add(RemoveSignature(position));
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> showAlertSignatureAdd(
    BuildContext context, GlobalKey<FormState> formKey) async {
  return await showDialog(
      context: context,
      builder: (context) {
        String _valueAdd = '';
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Crear asignatura',
            style: AppFont.fontTitleDialog(context),
          ),
          content: Form(
            key: formKey,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                'Ingresa el nombre de la asignatura:',
                style: AppFont.fontHeadline2(context),
              ),
              SizedBox(
                height: 16,
              ),
              GenericInput(
                validator: (String? value) {
                  return value!.isNotEmpty ? null : 'Campo vacío';
                },
                onChanged: (value) {
                  _valueAdd = value;
                },
                autofocus: true,
                hintText: 'Nombre de la asignatura',
                maxLength: 32,
              ),
            ]),
          ),
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
                  'Agregar'.toUpperCase(),
                  style: AppFont.fontTextButton(context),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    SignatureModel _signature = SignatureModel(name: _valueAdd);
                    BlocProvider.of<SignaturesBloc>(context)
                        .add(AddSignature(_signature));
                    BlocProvider.of<CRUDsignatureBloc>(context)
                        .add(CRUDAddSignature(_signature));
                    SnackBar _snackBar = GenericSnackBar(
                            context: context,
                            content: 'Se agregó la materia de $_valueAdd')
                        .snackBar();
                    ScaffoldMessenger.of(context).showSnackBar(_snackBar);

                    _valueAdd = '';
                    Navigator.of(context).pop();
                  }
                })
          ],
        );
      });
}
