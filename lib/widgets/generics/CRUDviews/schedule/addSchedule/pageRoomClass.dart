import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/CRUDsignature/CRUDsignature_bloc.dart';
import 'package:go_class_app/bloc/roomClass/classroom_bloc.dart';
import 'package:go_class_app/widgets/constants/screenSize.dart';
import 'package:go_class_app/widgets/generics/category.dart';
import 'package:go_class_app/widgets/generics/listTileCategory.dart';
import 'package:go_class_app/widgets/utils/classroomUtils.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:ionicons/ionicons.dart';

class AddclassroomSignature extends StatefulWidget {
  const AddclassroomSignature({Key? key}) : super(key: key);
  @override
  _AddclassroomSignatureState createState() => _AddclassroomSignatureState();
}

class _AddclassroomSignatureState extends State<AddclassroomSignature> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ClassroomBloc>(context).add(Loadclassroom());
  }

  @override
  Widget build(BuildContext context) {
    const EdgeInsets _padding =
        EdgeInsets.symmetric(vertical: 16, horizontal: 16);
    return BlocBuilder<ClassroomBloc, ClassroomState>(
      builder: (context, stateclassroom) =>
          BlocBuilder<CRUDsignatureBloc, CRUDsignatureState>(
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: _padding,
              child: GenericCategory(
                title: 'Sala',
              ),
            ),
            (stateclassroom.listclassroom.isNotEmpty)
                ? GenericListTileCategory(
                    title: 'Seleccionar sala',
                    iconData: Ionicons.location,
                    onTap: () async {
                      await _showAlertRoom(context);
                    },
                    subtitle: (state.classroomId != null &&
                            state.classroomId!.length != 0)
                        ? classroomByID(
                                id: state.classroomId,
                                classroomList: stateclassroom.listclassroom)
                            .name
                        : 'Ninguno',
                  )
                : Container(),
            GenericListTileCategory(
                title: 'Crear nueva sala',
                iconData: Ionicons.add,
                onTap: () {
                  Navigator.pushNamed(context, 'mainPage2CreateRoom');
                }),
          ],
        ),
      ),
    );
  }
}

Future<void> _showAlertRoom(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text('Selecciona un Sala',
                style: AppFont.fontTitleDialog(context)),
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
    BlocProvider.of<ClassroomBloc>(context).add(Loadclassroom());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CRUDsignatureBloc, CRUDsignatureState>(
      builder: (context, stateCRUDsignature) {
        return BlocBuilder<ClassroomBloc, ClassroomState>(
          builder: (context, state) {
            if (state.listclassroom.length > 0) {
              return Container(
                height: screenWidth(context) * 0.8,
                width: screenHeight(context) * 0.8,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.listclassroom.length,
                  itemBuilder: (context, index) => ListTile(
                    title: ListTile(
                      onTap: () {
                        BlocProvider.of<CRUDsignatureBloc>(context)
                            .add(CRUDAddRoom(state.listclassroom[index].id!));
                      },
                      title: Text(
                        '${state.listclassroom[index].name}',
                        style: AppFont.font(TextStyle(
                            color:
                                Theme.of(context).textTheme.headline1!.color)),
                      ),
                      subtitle:
                          (state.listclassroom[index].description!.isNotEmpty)
                              ? Text(
                                  state.listclassroom[index].description!,
                                  style: AppFont.font(TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .color)),
                                )
                              : null,
                      trailing: (stateCRUDsignature.classroomId ==
                              state.listclassroom[index].id)
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
