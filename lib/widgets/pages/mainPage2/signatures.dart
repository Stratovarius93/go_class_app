part of 'mainPage2.dart';

class _Signatures extends StatefulWidget {
  const _Signatures({
    Key? key,
  }) : super(key: key);

  @override
  __SignaturesState createState() => __SignaturesState();
}

class __SignaturesState extends State<_Signatures> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SignaturesBloc>(context).add(LoadSignature());
  }

  GlobalKey<FormState> _formKeyEdit = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double _degrees = 15;
    return BlocBuilder<ScheduleBloc, ScheduleState>(
      builder: (context, stateSchedule) =>
          BlocBuilder<SignaturesBloc, SignaturesState>(
              builder: (context, state) {
        if (state.listSignatures.isNotEmpty) {
          return GenericCard(
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.listSignatures.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 1, horizontal: 16),
                  leading: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).secondaryHeaderColor.withOpacity(0.2),
                    child: Center(
                      child: Transform.rotate(
                        angle: _degrees * -math.pi / 180,
                        child: Text(
                          '${state.listSignatures[index].name[0]}',
                          style: AppFont.font(TextStyle(
                              color: Theme.of(context).secondaryHeaderColor,
                              fontSize: 26,
                              fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    '${state.listSignatures[index].name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppFont.font(TextStyle(
                        color: Theme.of(context).textTheme.headline3!.color)),
                  ),
                  //subtitle: Text('Hola'),
                  trailing: GenericPopMenuItem(
                      popupMenuItemModelList: _listOptionsSignature(
                    context,
                    state.listSignatures[index],
                    _formKeyEdit,
                    () async {
                      int _count = 0;
                      for (var i = 0, len = stateSchedule.scheduleList.length;
                          i < len;
                          ++i) {
                        for (var j = 0,
                                len = stateSchedule
                                    .scheduleList[i].scheduleList.length;
                            j < len;
                            ++j) {
                          if (stateSchedule.scheduleList[i].scheduleList[j]
                                  .idSignature ==
                              state.listSignatures[index].id) {
                            _count++;
                          }
                        }
                      }
                      if (_count > 0) {
                        await showAlertSignatureRemove2(
                            context, state.listSignatures[index]);
                      } else {
                        await showAlertSignatureRemove(
                            context, state.listSignatures[index]);
                      }
                    },
                  ))),
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  indent: 16,
                  endIndent: 16,
                  height: 1,
                  color: Colors.grey.withOpacity(0.5),
                );
              },
            ),
          );
        } else {
          return GenericAddNewItem(
            title: '${AppLocalizations.of(context)!.addNew}',
            onTap: () async {
              await showAlertSignatureAdd(context, _formKeyEdit);
            },
            iconData: Ionicons.journal_outline,
          );
        }
      }),
    );
  }
}

List<PopupMenuItemModel> _listOptionsSignature(
  BuildContext context,
  SignatureModel signature,
  GlobalKey<FormState> formKey,
  VoidCallback onTap,
) {
  List<PopupMenuItemModel> _list = [
    PopupMenuItemModel(
      title: '${AppLocalizations.of(context)!.popMenu_edit}',
      icon: Icon(
        Ionicons.create_outline,
        color: Theme.of(context).textTheme.headline1!.color,
      ),
      onTap: () async {
        await showAlertSignatureEdit(context, signature, formKey);
      },
      visible: true,
    ),
    PopupMenuItemModel(
      title: '${AppLocalizations.of(context)!.popMenu_remove}',
      icon: Icon(
        Ionicons.trash_outline,
        color: Theme.of(context).textTheme.headline1!.color,
      ),
      onTap: onTap,
      visible: true,
    ),
  ];
  return _list;
}
