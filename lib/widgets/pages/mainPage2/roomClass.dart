part of 'mainPage2.dart';

class _Classroom extends StatefulWidget {
  final BuildContext? contextRoute;
  const _Classroom(this.contextRoute);
  @override
  __ClassroomState createState() => __ClassroomState();
}

class __ClassroomState extends State<_Classroom> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ClassroomBloc>(context).add(Loadclassroom());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassroomBloc, ClassroomState>(
        builder: (context, state) {
      if (state.listclassroom.isNotEmpty) {
        return GenericCard(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.listclassroom.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 1, horizontal: 16),
                leading: CircleAvatar(
                  backgroundColor: (state.listclassroom[index].type ==
                          TypeDescription.url)
                      ? Theme.of(context).primaryColor.withOpacity(0.2)
                      : Theme.of(context).secondaryHeaderColor.withOpacity(0.2),
                  child: Center(
                    child:
                        (state.listclassroom[index].type == TypeDescription.url)
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
                  '${state.listclassroom[index].name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppFont.font(TextStyle(
                      color: (state.listclassroom[index].type ==
                              TypeDescription.url)
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.w500)),
                ),
                subtitle: Text(
                  subtitleClassroom(state.listclassroom[index], context),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppFont.font(TextStyle(
                      color: Theme.of(context).textTheme.headline2!.color)),
                ),
                trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                  (state.listclassroom[index].type == TypeDescription.url)
                      ? IconButton(
                          onPressed: () {
                            //launch(_url);
                            _launchURL(state.listclassroom[index], context);
                          },
                          icon: Icon(
                            Ionicons.open_outline,
                            color: Theme.of(context).primaryColor,
                          ))
                      : Container(),
                  GenericPopMenuItem(
                      popupMenuItemModelList:
                          _listOptions(context, state.listclassroom[index]))
                ]),
              ),
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  indent: 16,
                  endIndent: 16,
                  height: 1,
                  color: Colors.grey.withOpacity(0.5),
                );
              },
            ),
          ),
        );
      } else {
        return GenericAddNewItem(
          title: '${AppLocalizations.of(context)!.addNew}',
          onTap: () {
            Navigator.pushNamed(
              widget.contextRoute!,
              'mainPage2CreateRoom',
            );
          },
          iconData: Ionicons.location_outline,
        );
      }
    });
  }
}

List<PopupMenuItemModel> _listOptions(
    BuildContext context, ClassroomModel classroom) {
  List<PopupMenuItemModel> _list = [
    PopupMenuItemModel(
      title: '${AppLocalizations.of(context)!.popMenu_url}',
      icon: Icon(
        Ionicons.share_outline,
        color: Theme.of(context).textTheme.headline1!.color,
      ),
      onTap: () {
        Share.share(classroom.description!);
      },
      visible: (classroom.type == TypeDescription.text) ? false : true,
    ),
    PopupMenuItemModel(
      title: '${AppLocalizations.of(context)!.popMenu_edit}',
      icon: Icon(
        Ionicons.create_outline,
        color: Theme.of(context).textTheme.headline1!.color,
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditclassroomPage(
                      classroom: classroom,
                    )));
      },
      visible: true,
    ),
    PopupMenuItemModel(
      title: '${AppLocalizations.of(context)!.popMenu_remove}',
      icon: Icon(
        Ionicons.trash_outline,
        color: Theme.of(context).textTheme.headline1!.color,
      ),
      onTap: () {
        showAlertclassroomRemove(context, classroom);
      },
      visible: true,
    ),
  ];
  List<PopupMenuItemModel> _list2 = [
    PopupMenuItemModel(
      title: '${AppLocalizations.of(context)!.popMenu_edit}',
      icon: Icon(
        Ionicons.create_outline,
        color: Theme.of(context).textTheme.headline1!.color,
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditclassroomPage(
                      classroom: classroom,
                    )));
      },
      visible: true,
    ),
    PopupMenuItemModel(
      title: '${AppLocalizations.of(context)!.popMenu_remove}',
      icon: Icon(
        Ionicons.trash_outline,
        color: Theme.of(context).textTheme.headline1!.color,
      ),
      onTap: () {
        showAlertclassroomRemove(context, classroom);
      },
      visible: true,
    ),
  ];

  if (classroom.type == TypeDescription.url) {
    return _list;
  } else {
    return _list2;
  }
}

void _launchURL(ClassroomModel classroom, BuildContext context) async {
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
