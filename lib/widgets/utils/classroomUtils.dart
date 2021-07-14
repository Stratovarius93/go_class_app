import 'package:flutter/material.dart';
import 'package:go_class_app/models/classroom/room_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

ClassroomModel classroomByID(
    {String? id, List<ClassroomModel>? classroomList}) {
  ClassroomModel _classroom =
      ClassroomModel(name: '', description: '', type: TypeDescription.text);
  for (var i = 0, len = classroomList!.length; i < len; ++i) {
    if (classroomList[i].id == id) {
      _classroom = classroomList[i];
    }
  }
  return _classroom;
}

bool findClassroom({String? id, List<ClassroomModel>? classroomList}) {
  bool _find = false;
  if (id != null) {
    for (var i = 0, len = classroomList!.length; i < len; ++i) {
      if (classroomList[i].id == id) {
        _find = true;
      }
    }
  } else {
    _find = false;
  }
  return _find;
}

String subtitleClassroom(ClassroomModel listclassroom, BuildContext context) {
  if (listclassroom.type == TypeDescription.text) {
    if (listclassroom.description == 'presencial') {
      return '${AppLocalizations.of(context)!.addClassroom_descriptionOnSite}';
    } else {
      return '${AppLocalizations.of(context)!.addClassroom_descriptionNone}';
    }
  } else {
    return listclassroom.description!;
  }
}
