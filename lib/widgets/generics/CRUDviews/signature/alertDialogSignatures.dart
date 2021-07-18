import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/CRUDsignature/CRUDsignature_bloc.dart';
import 'package:go_class_app/bloc/schedule/schedule_bloc.dart';
import 'package:go_class_app/bloc/signatures/signatures_bloc.dart';
import 'package:go_class_app/models/signature/signature_model.dart';
import 'package:go_class_app/widgets/constants/colors.dart';
import 'package:go_class_app/widgets/generics/input.dart';
import 'package:go_class_app/widgets/generics/snackBar.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:min_id/min_id.dart';

Future<void> showAlertSignatureEdit(BuildContext context,
    SignatureModel signature, GlobalKey<FormState> formKey) async {
  return await showDialog(
    context: context,
    builder: (context) {
      String _newValueAdd = signature.name;
      return AlertDialog(
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          '${AppLocalizations.of(context)!.editAlert_signatureTitle}',
          style: AppFont.fontTitleDialog(context),
        ),
        content: Form(
          key: formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${AppLocalizations.of(context)!.editAlert_signaturePart1}',
                  style: AppFont.fontHeadline2(context),
                ),
                SizedBox(
                  height: 16,
                ),
                GenericInput(
                  controller: TextEditingController(text: signature.name),
                  autofocus: true,
                  validator: (String? value) {
                    return value!.isNotEmpty
                        ? null
                        : '${AppLocalizations.of(context)!.inputValidator}';
                  },
                  onChanged: (value) {
                    _newValueAdd = value;
                  },
                  maxLength: 32,
                  hintText:
                      '${AppLocalizations.of(context)!.addAlert_signature_hintText}',
                ),
              ]),
        ),
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
              '${AppLocalizations.of(context)!.buttonAlert_update}',
              style: AppFont.fontTextButton(context),
            ),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                SignatureModel _newSignature =
                    SignatureModel(name: _newValueAdd);
                BlocProvider.of<SignaturesBloc>(context)
                    .add(EditSignature(signature, _newSignature));
                _newValueAdd = '';
                SnackBar _snackBar = GenericSnackBar(
                        duration: Duration(milliseconds: 1500),
                        color: Color(0xFF5a8896),
                        context: context,
                        content:
                            '${AppLocalizations.of(context)!.snackBar_edit_signature}')
                    .snackBar();
                ScaffoldMessenger.of(context).showSnackBar(_snackBar);

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
    BuildContext context, SignatureModel signature) async {
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
        content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text:
                          '${AppLocalizations.of(context)!.removeAlert_signature2Part1} ',
                      style: AppFont.fontHeadline2(context)),
                  TextSpan(
                      text: '${signature.name}',
                      style: AppFont.fontHeadline2Bold(context)),
                  TextSpan(
                      text:
                          '${AppLocalizations.of(context)!.removeAlert_signature2Part2}',
                      style: AppFont.fontHeadline2(context)),
                  TextSpan(
                      text:
                          '${AppLocalizations.of(context)!.removeAlert_signature2Part3}',
                      style: AppFont.fontHeadline2(context)),
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
              BlocProvider.of<ScheduleBloc>(context)
                  .add(RemoveScheduleSignature(signature));
              BlocProvider.of<SignaturesBloc>(context)
                  .add(RemoveSignature(signature));
              SnackBar _snackBar = GenericSnackBar(
                      duration: Duration(milliseconds: 1500),
                      color: AppColorLight.listSchedule[5],
                      context: context,
                      content:
                          '${AppLocalizations.of(context)!.snackBar_remove_signature}')
                  .snackBar();
              ScaffoldMessenger.of(context).showSnackBar(_snackBar);

              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> showAlertSignatureRemove(
    BuildContext context, SignatureModel signature) async {
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
        content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text:
                          '${AppLocalizations.of(context)!.removeAlert_schedulePart1} ',
                      style: AppFont.fontHeadline2(context)),
                  TextSpan(
                      text: '${signature.name}',
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
              BlocProvider.of<SignaturesBloc>(context)
                  .add(RemoveSignature(signature));
              SnackBar _snackBar = GenericSnackBar(
                      duration: Duration(milliseconds: 1500),
                      color: AppColorLight.listSchedule[5],
                      context: context,
                      content:
                          '${AppLocalizations.of(context)!.snackBar_remove_signature}')
                  .snackBar();
              ScaffoldMessenger.of(context).showSnackBar(_snackBar);

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
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            '${AppLocalizations.of(context)!.addAlert_signatureTitle}',
            style: AppFont.fontTitleDialog(context),
          ),
          content: Form(
            key: formKey,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${AppLocalizations.of(context)!.addAlert_signaturePart1}',
                    textAlign: TextAlign.start,
                    style: AppFont.fontHeadline2(context),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GenericInput(
                    validator: (String? value) {
                      return value!.isNotEmpty
                          ? null
                          : '${AppLocalizations.of(context)!.inputValidator}';
                    },
                    onChanged: (value) {
                      _valueAdd = value;
                    },
                    autofocus: true,
                    hintText:
                        '${AppLocalizations.of(context)!.addAlert_signature_hintText}',
                    maxLength: 32,
                  ),
                ]),
          ),
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
                  '${AppLocalizations.of(context)!.buttonAlert_add}',
                  style: AppFont.fontTextButton(context),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final String id = MinId.getId();
                    SignatureModel _signature =
                        SignatureModel(id: id, name: _valueAdd);
                    BlocProvider.of<SignaturesBloc>(context)
                        .add(AddSignature(_signature));
                    BlocProvider.of<CRUDsignatureBloc>(context)
                        .add(CRUDAddSignature(_signature.id!));
                    SnackBar _snackBar = GenericSnackBar(
                            context: context,
                            content:
                                '${AppLocalizations.of(context)!.snackBar_addSignature} $_valueAdd')
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
