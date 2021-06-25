import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'popMenuItemModel.dart';

class GenericPopMenuItem extends StatelessWidget {
  final List<PopupMenuItemModel> popupMenuItemModelList;

  const GenericPopMenuItem({Key? key, required this.popupMenuItemModelList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(
        Ionicons.ellipsis_vertical_sharp,
        color: Theme.of(context).textTheme.headline2!.color!.withOpacity(0.3),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onSelected: (int value) {
        popupMenuItemModelList[value].onTap!.call();
      },
      elevation: 4,
      offset: Offset(0, 10),
      itemBuilder: (BuildContext context) {
        List<PopupMenuEntry<int>> _list = [];

        for (var i = 0, len = popupMenuItemModelList.length; i < len; ++i) {
          PopupMenuItem<int> _pop = PopupMenuItem<int>(
            child: Row(children: [
              popupMenuItemModelList[i].icon!,
              SizedBox(
                width: 8,
              ),
              Text(
                popupMenuItemModelList[i].title!,
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline1!.color,
                ),
              ),
            ]),
            value: i,
          );

          _list.add(_pop);
        }
        //return popupMenuItemModelList.map((item) {
        //var index = popupMenuItemModelList.indexOf(item);
        //if (item.visible!) {
        //return PopupMenuItem(
        //child: Row(children: [
        //popupMenuItemModelList[index].icon!,
        //SizedBox(
        //width: 8,
        //),
        //Text(
        //item.title!,
        //style: TextStyle(
        //color: Theme.of(context).textTheme.headline1!.color,
        //),
        //),
        //]),
        //value: index,
        //);
        //}
        //}).toList();

        return _list;
      },
    );
  }
}
