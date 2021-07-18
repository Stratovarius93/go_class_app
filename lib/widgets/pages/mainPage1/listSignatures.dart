part of 'mainPage1.dart';

class ListSignaturesView extends StatefulWidget {
  final List<SignatureModel> listSignatures;
  final List<TeacherModel> listTeacher;
  final List<ClassroomModel> listClassroom;
  final List<ItemScheduleModel> listItemScheduleModel;
  final int pos;
  const ListSignaturesView({
    Key? key,
    required this.listItemScheduleModel,
    required this.pos,
    required this.listSignatures,
    required this.listTeacher,
    required this.listClassroom,
  }) : super(key: key);
  @override
  _ListSignaturesViewState createState() => _ListSignaturesViewState();
}

class _ListSignaturesViewState extends State<ListSignaturesView> {
  @override
  Widget build(BuildContext context) {
    if (widget.listItemScheduleModel.isNotEmpty) {
      return Container(
        child: ListView(physics: BouncingScrollPhysics(), children: [
          ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: widget.listItemScheduleModel.map((e) {
              int index = widget.listItemScheduleModel.indexOf(e);
              return _ItemSchedule(
                pos: widget.pos,
                index: index,
                itemScheduleModel: widget.listItemScheduleModel[index],
                teacherList: widget.listTeacher,
                signatureList: widget.listSignatures,
                classroomList: widget.listClassroom,
              );
            }).toList(),
          ),
          SizedBox(
            height: 16,
          ),
          _AddNewSignature(),
          SizedBox(
            height: 50,
          )
        ]),
      );
    } else {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GenericAddNewItemRive(
                title: '${AppLocalizations.of(context)!.addNew}',
                onTap: () {
                  Navigator.pushNamed(_context!, 'mainPage1AddSchedule');
                },
                iconData: Ionicons.calendar_outline),
          ]);
    }
  }
}

class _AddNewSignature extends StatelessWidget {
  const _AddNewSignature({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(_context!, 'mainPage1AddSchedule');
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            //color: Color(0xFFc5dce8),
            color: Color(0xFFc5dce8).withOpacity(0.4),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              '${AppLocalizations.of(context)!.mainPage1_addSignature}',
              style: AppFont.font(TextStyle(
                  //color: Color(0xFF59656e),
                  color: Theme.of(context).textTheme.headline5!.color,
                  fontSize: 20,
                  fontWeight: FontWeight.w300)),
            ),
            SizedBox(
              width: 16,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(_context!, 'mainPage1AddSchedule');
                },
                icon: Icon(
                  Ionicons.add_circle,
                  //color: Color(0xFF59656e),
                  color: Theme.of(context).textTheme.headline5!.color,
                ))
          ]),
        ),
      ),
    );
  }
}

class _ItemSchedule extends StatelessWidget {
  const _ItemSchedule({
    Key? key,
    required this.pos,
    required this.index,
    required this.itemScheduleModel,
    required this.teacherList,
    required this.signatureList,
    required this.classroomList,
  }) : super(key: key);

  final int pos;
  final int index;
  final ItemScheduleModel itemScheduleModel;
  final List<TeacherModel> teacherList;
  final List<SignatureModel> signatureList;
  final List<ClassroomModel> classroomList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: GenericCard(
        child: ListTile(
          onTap: () async {
            await _showScheduleSignatureSelected(
                context: context,
                position: index,
                teacher: teacherByID(
                    id: itemScheduleModel.idTeacher, teacherList: teacherList),
                classroom: classroomByID(
                    id: itemScheduleModel.idClassroom,
                    classroomList: classroomList),
                signature: signatureByID(
                    id: itemScheduleModel.idSignature,
                    signatureList: signatureList));
          },
          leading: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColorLight.listSchedule[itemScheduleModel.color]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${itemScheduleModel.timeIn.format(context)}'
                        .padLeft(5, '0'),
                    style: AppFont.font(TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '${itemScheduleModel.timeOut.format(context)}'
                        .padLeft(5, '0'),
                    style: AppFont.font(
                        TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              )),
          title: (findSignature(
                  id: itemScheduleModel.idSignature,
                  signatureList: signatureList))
              ? Text(
                  '${signatureByID(id: itemScheduleModel.idSignature, signatureList: signatureList).name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppFont.font(TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16)),
                )
              : Text(
                  '${AppLocalizations.of(context)!.noName}',
                  style: AppFont.font(TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16)),
                ),
          subtitle: (findTeacher(
                  id: itemScheduleModel.idTeacher, teacherList: teacherList))
              ? Text(
                  '${teacherByID(id: itemScheduleModel.idTeacher, teacherList: teacherList).name} ${teacherByID(id: itemScheduleModel.idTeacher, teacherList: teacherList).lastName}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppFont.font(TextStyle(
                    color: Theme.of(context).textTheme.headline2!.color,
                    fontWeight: FontWeight.w400,
                  )),
                )
              : Text(
                  '${AppLocalizations.of(context)!.noTeacher}',
                  style: AppFont.font(TextStyle(
                    color: Theme.of(context).textTheme.headline2!.color,
                    fontWeight: FontWeight.w400,
                  )),
                ),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            (findClassroom(
                        id: itemScheduleModel.idClassroom,
                        classroomList: classroomList) &&
                    //itemScheduleModel.classroom!.type == TypeDescription.url
                    classroomByID(
                                id: itemScheduleModel.idClassroom,
                                classroomList: classroomList)
                            .type ==
                        TypeDescription.url)
                ? IconButton(
                    onPressed: () {
                      //launch(_url);
                      _launchURL(
                          classroomByID(
                              id: itemScheduleModel.idClassroom,
                              classroomList: classroomList),
                          index,
                          context);
                    },
                    icon: Icon(
                      Ionicons.open_outline,
                      color: Theme.of(context).primaryColor,
                    ))
                : Container(),
            GenericPopMenuItem(
                popupMenuItemModelList: _listOptions(
                    context, pos, index, itemScheduleModel, signatureList)),
          ]),
        ),
      ),
    );
  }
}

List<PopupMenuItemModel> _listOptions(
    BuildContext context,
    int currentDay,
    int position,
    ItemScheduleModel itemScheduleModel,
    List<SignatureModel> list) {
  List<PopupMenuItemModel> _list = [
    PopupMenuItemModel(
      title: '${AppLocalizations.of(context)!.popMenu_edit}',
      icon: Icon(
        Ionicons.create_outline,
        color: Theme.of(context).textTheme.headline1!.color,
      ),
      onTap: () {
        BlocProvider.of<CRUDsignatureBloc>(context)
            .add(CRUDAddItemScheduleModel(itemScheduleModel));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditSchedulePage(position: position)));
      },
      visible: true,
    ),
    PopupMenuItemModel(
      title: '${AppLocalizations.of(context)!.popMenu_remove}',
      icon: Icon(
        Ionicons.trash_outline,
        color: Theme.of(context).textTheme.headline1!.color,
      ),
      onTap: () async {
        await showAlertRemoveSchedule(
            context, position, currentDay, itemScheduleModel, list);
      },
      visible: true,
    ),
  ];
  return _list;
}

void _launchURL(
    ClassroomModel classroom, int position, BuildContext context) async {
  String _url = classroom.description!;

  SnackBar _snackBar = GenericSnackBar(
      color: AppColorLight.listSchedule[5],
      context: context,
      content: '${AppLocalizations.of(context)!.snackBar_URL}',
      action: '${AppLocalizations.of(context)!.popMenu_edit}'.toUpperCase(),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditclassroomPage(
                      classroom: classroom,
                    )));
      }).snackBar();

  await canLaunch(_url)
      ? await launch(_url)
      : ScaffoldMessenger.of(context).showSnackBar(_snackBar);
}

Future<void> _showScheduleSignatureSelected(
    {BuildContext? context,
    int? position,
    TeacherModel? teacher,
    ClassroomModel? classroom,
    SignatureModel? signature}) async {
  final double _degrees = 15;
  print('Teacher: ${teacher!.id}');
  print('Classroom: ${classroom!.id}');
  print('Signature: ${signature!.id}');
  return await showDialog(
    context: context!,
    builder: (alertContext) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: screenWidth(context) * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 16,
              ),
              CircleAvatar(
                backgroundColor: Color(0xFFc5dce8).withOpacity(0.5),
                radius: 50,
                child: CircleAvatar(
                  backgroundColor: Color(0xFFc5dce8),
                  radius: 25,
                  child: Icon(
                    Ionicons.school_outline,
                    color: Color(0xFF59656e),
                    size: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                '${signature.name}',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppFont.font(TextStyle(
                    color: Theme.of(context).textTheme.headline1!.color,
                    fontSize: 26,
                    fontWeight: FontWeight.w300)),
              ),
              SizedBox(
                height: 16,
              ),
              (teacher.id != null && teacher.id!.length != 0)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GenericCategory(
                          title:
                              '${AppLocalizations.of(context)!.addSchedule_teacher}',
                        ),
                      ),
                    )
                  : Container(),
              (teacher.name.isNotEmpty && teacher.name.length != 0)
                  ? Container(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context)
                              .secondaryHeaderColor
                              .withOpacity(0.2),
                          child: Center(
                            child: Transform.rotate(
                              angle: _degrees * -math.pi / 180,
                              child: Text(
                                '${teacher.name[0]}',
                                style: AppFont.font(TextStyle(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w400)),
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          '${teacher.name} ${teacher.lastName}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppFont.font(TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .color)),
                        ),
                        subtitle: (teacher.phoneNumber!.isNotEmpty)
                            ? Text(
                                '${teacher.phoneNumber}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppFont.font(TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .color)),
                              )
                            : null,
                        trailing: (teacher.phoneNumber!.isNotEmpty)
                            ? IconButton(
                                onPressed: () {
                                  teacherDial(teacher.phoneNumber!);
                                },
                                icon: Icon(
                                  Ionicons.call_outline,
                                  color: Theme.of(context).primaryColor,
                                ))
                            : null,
                      ),
                    )
                  : Container(),
              (classroom.id != null)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GenericCategory(
                          title:
                              '${AppLocalizations.of(context)!.addSchedule_classroom}',
                        ),
                      ),
                    )
                  : Container(),
              (classroom.id != null)
                  ? ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 1, horizontal: 16),
                      leading: CircleAvatar(
                        backgroundColor: (classroom.type == TypeDescription.url)
                            ? Theme.of(context).primaryColor.withOpacity(0.2)
                            : Theme.of(context)
                                .secondaryHeaderColor
                                .withOpacity(0.2),
                        child: Center(
                          child: (classroom.type == TypeDescription.url)
                              ? Icon(
                                  Ionicons.globe_outline,
                                  color: Theme.of(context).primaryColor,
                                )
                              : Icon(
                                  Ionicons.location_outline,
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                        ),
                      ),
                      title: Text(
                        '${classroom.name}',
                        style: AppFont.font(TextStyle(
                            color: (classroom.type == TypeDescription.url)
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).secondaryHeaderColor,
                            fontWeight: FontWeight.w500)),
                      ),
                      subtitle: Text(
                        '${subtitleClassroom(classroom, context)}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: AppFont.font(TextStyle(
                            color:
                                Theme.of(context).textTheme.headline2!.color)),
                      ),
                      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        (classroom.type == TypeDescription.url)
                            ? IconButton(
                                onPressed: () {
                                  _launchURL(classroom, position!, context);
                                  Navigator.pop(alertContext);
                                },
                                icon: Icon(
                                  Ionicons.open_outline,
                                  color: Theme.of(context).primaryColor,
                                ))
                            : Container(),
                      ]),
                    )
                  : Container(),
            ],
          ),
        ),
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
              Navigator.pop(alertContext);
            },
          )
        ],
      );
    },
  );
}
