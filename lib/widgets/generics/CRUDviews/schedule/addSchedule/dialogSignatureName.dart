import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/CRUDsignature/CRUDsignature_bloc.dart';
import 'package:go_class_app/bloc/signatures/signatures_bloc.dart';
import 'package:go_class_app/widgets/constants/screenSize.dart';
import 'package:go_class_app/widgets/generics/CRUDviews/signature/alertDialogSignatures.dart';
import 'package:go_class_app/widgets/generics/category.dart';
import 'package:go_class_app/widgets/generics/listTileCategory.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:go_class_app/widgets/utils/signatureUtils.dart';
import 'package:ionicons/ionicons.dart';

class AddSignatureName extends StatefulWidget {
  const AddSignatureName({Key? key}) : super(key: key);
  @override
  _AddSignatureNameState createState() => _AddSignatureNameState();
}

class _AddSignatureNameState extends State<AddSignatureName> {
  @override
  void initState() {
    BlocProvider.of<SignaturesBloc>(context).add(LoadSignature());
    super.initState();
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    const EdgeInsets _padding =
        EdgeInsets.symmetric(vertical: 16, horizontal: 16);
    return BlocBuilder<SignaturesBloc, SignaturesState>(
      builder: (context, stateSignature) {
        return BlocBuilder<CRUDsignatureBloc, CRUDsignatureState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: _padding,
                  child: GenericCategory(
                    title: 'Nombre asignatura',
                  ),
                ),
                (stateSignature.listSignatures.isNotEmpty)
                    ? GenericListTileCategory(
                        title: 'Seleccionar nombre',
                        iconData: Ionicons.school,
                        onTap: () async {
                          await _showAlertSchedule(context);
                        },
                        subtitle: (state.signatureId != null)
                            ? signatureByID(
                                    id: state.signatureId,
                                    signatureList:
                                        stateSignature.listSignatures)
                                .name
                            : 'Ninguno',
                      )
                    : Container(),
                GenericListTileCategory(
                    title: 'Crear nuevo nombre',
                    iconData: Ionicons.add,
                    onTap: () {
                      showAlertSignatureAdd(
                        context,
                        _formKey,
                      );
                    }),
              ],
            );
          },
        );
      },
    );
  }
}

Future<void> _showAlertSchedule(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(
              'Selecciona una materia',
              style: AppFont.fontTitleDialog(context),
            ),
            content: _ListView(),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Aceptar'.toUpperCase(),
                    style: AppFont.font(
                        TextStyle(color: Theme.of(context).primaryColor)),
                  )),
            ],
          ));
}

class _ListView extends StatefulWidget {
  const _ListView({
    Key? key,
  }) : super(key: key);

  @override
  __ListViewState createState() => __ListViewState();
}

class __ListViewState extends State<_ListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SignaturesBloc>(context).add(LoadSignature());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CRUDsignatureBloc, CRUDsignatureState>(
      builder: (context, stateCRUDsignature) {
        return BlocBuilder<SignaturesBloc, SignaturesState>(
          builder: (context, state) {
            if (state.listSignatures.length > 0) {
              return Container(
                height: screenWidth(context) * 0.8,
                width: screenHeight(context) * 0.8,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.listSignatures.length,
                  itemBuilder: (context, index) => ListTile(
                    title: ListTile(
                      onTap: () {
                        BlocProvider.of<CRUDsignatureBloc>(context).add(
                            CRUDAddSignature(state.listSignatures[index].id!));
                      },
                      title: Text(
                        state.listSignatures[index].name,
                        style: AppFont.font(TextStyle(
                            color:
                                Theme.of(context).textTheme.headline1!.color)),
                      ),
                      trailing: (stateCRUDsignature.signatureId != null &&
                              stateCRUDsignature.signatureId ==
                                  state.listSignatures[index].id)
                          ? CircleAvatar(
                              backgroundColor: Theme.of(context)
                                  .secondaryHeaderColor
                                  .withOpacity(0.3),
                              child: Icon(
                                Ionicons.checkmark,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
