part of 'mainPage1.dart';

class ListSignaturesView extends StatefulWidget {
  final String? day;

  const ListSignaturesView({Key? key, this.day}) : super(key: key);
  @override
  _ListSignaturesViewState createState() => _ListSignaturesViewState();
}

class _ListSignaturesViewState extends State<ListSignaturesView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ScheduleBloc>(context).add(LoadSchedule());
  }

  @override
  Widget build(BuildContext context) {
    int _position(String? day) {
      int position = 0;
      for (var i = 0, len = weekList.length; i < len; ++i) {
        if (weekList[i].name == day) {
          position = i;
        }
      }
      return position;
    }

    int pos = _position(widget.day);

    return BlocBuilder<ScheduleBloc, ScheduleState>(builder: (context, state) {
      if (state.scheduleList.isNotEmpty) {
        return Container(
          child: ListView(physics: BouncingScrollPhysics(),
              //shrinkWrap: true,
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.scheduleList[pos].length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: GenericCard(
                      child: ListTile(
                        leading: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: state.scheduleList[pos][index].color),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${state.scheduleList[pos][index].timeIn.format(context)}'
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
                                  '${state.scheduleList[pos][index].timeOut.format(context)}'
                                      .padLeft(5, '0'),
                                  style: AppFont.font(TextStyle(
                                      color: Colors.white, fontSize: 16)),
                                ),
                              ],
                            )),
                        title: Text(
                          state.scheduleList[pos][index].name!.name!,
                          style: AppFont.font(TextStyle(
                              color: Theme.of(context).secondaryHeaderColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16)),
                        ),
                        subtitle:
                            (state.scheduleList[pos][index].teacher != null &&
                                    state.scheduleList[pos][index].teacher!.name
                                        .isNotEmpty)
                                ? Text(
                                    '${state.scheduleList[pos][index].teacher!.name} ${state.scheduleList[pos][index].teacher!.lastName}',
                                    style: AppFont.font(TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .color,
                                      fontWeight: FontWeight.w400,
                                    )),
                                  )
                                : Text(
                                    'Sin docente',
                                    style: AppFont.font(TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .color,
                                      fontWeight: FontWeight.w400,
                                    )),
                                  ),
                        trailing:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          (state.scheduleList[pos][index].classroom != null &&
                                  state.scheduleList[pos][index].classroom!
                                          .type ==
                                      TypeDescription.url)
                              ? IconButton(
                                  onPressed: () {
                                    //launch(_url);
                                    _launchURL(
                                        state.scheduleList[pos][index]
                                            .classroom!,
                                        index,
                                        context);
                                  },
                                  icon: Icon(
                                    Ionicons.open_outline,
                                    color: Theme.of(context).primaryColor,
                                  ))
                              : Container(),
                          GenericPopMenuItem(
                              popupMenuItemModelList: _listOptions(context, pos,
                                  index, state.scheduleList[pos][index])),
                        ]),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(_context!, 'mainPage1AddSchedule');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFFc5dce8),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Añadir asignatura',
                              style: AppFont.font(TextStyle(
                                  color: Color(0xFF59656e),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300)),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      _context!, 'mainPage1AddSchedule');
                                },
                                icon: Icon(
                                  Ionicons.add_circle,
                                  color: Color(0xFF59656e),
                                ))
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ]),
        );
      } else {
        return Container();
      }
    });
  }
}

List<PopupMenuItemModel> _listOptions(BuildContext context, int currentDay,
    int position, ItemScheduleModel itemScheduleModel) {
  List<PopupMenuItemModel> _list = [
    PopupMenuItemModel(
      title: 'Editar',
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
      title: 'Eliminar',
      icon: Icon(
        Ionicons.trash_outline,
        color: Theme.of(context).textTheme.headline1!.color,
      ),
      onTap: () async {
        await _showAlert(context, position, currentDay, itemScheduleModel);
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
          context: context,
          content: 'No se pudo abrir la URL',
          action: 'EDITAR',
          onTap: () {})
      .snackBar();

  await canLaunch(_url)
      ? await launch(_url)
      : ScaffoldMessenger.of(context).showSnackBar(_snackBar);
}

Future<void> _showAlert(BuildContext context, int position, int currentDay,
    ItemScheduleModel itemScheduleModel) async {
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
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}
