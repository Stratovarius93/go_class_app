import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_class_app/models/itemSchedule_model.dart';
import 'package:go_class_app/models/room_model.dart';
import 'package:go_class_app/models/signature_model.dart';
import 'package:go_class_app/models/teacher_model.dart';
import 'package:go_class_app/widgets/constants/colors.dart';
import 'package:meta/meta.dart';

part 'CRUDsignature_event.dart';
part 'CRUDsignature_state.dart';

class CRUDsignatureBloc extends Bloc<CRUDsignatureEvent, CRUDsignatureState> {
  CRUDsignatureBloc() : super(CRUDsignatureState());

  @override
  Stream<CRUDsignatureState> mapEventToState(
    CRUDsignatureEvent event,
  ) async* {
    if (event is CRUDAddSignature) {
      yield* _addSignature(event.signatureName, state);
    } else if (event is CRUDAddTeacher) {
      yield* _addTeacher(event.teacher, state);
    } else if (event is CRUDAddTimeOfDayIn) {
      yield* _addTimeOfDayIn(event.timeIn, state);
    } else if (event is CRUDAddTimeOfDayOut) {
      yield* _addTimeOfDayOut(event.timeOut, state);
    } else if (event is CRUDAddRoom) {
      yield* _addRoom(event.classroom, state);
    } else if (event is CRUDAddColor) {
      yield* _addColor(event.color, state);
    } else if (event is CRUDclean) {
      yield* _clean();
    } else if (event is CRUDAddItemScheduleModel) {
      yield* _addItemScheduleModel(event.itemScheduleModel);
    }
  }
}

Stream<CRUDsignatureState> _addSignature(
    SignatureModel signatureName, CRUDsignatureState state) async* {
  yield CRUDsignatureState(
      signatureName: signatureName,
      teacher: state.teacher,
      classroom: state.classroom,
      color: state.color,
      timeIn: state.timeIn,
      timeOut: state.timeOut);
}

Stream<CRUDsignatureState> _addTeacher(
    TeacherModel teacher, CRUDsignatureState state) async* {
  yield CRUDsignatureState(
      teacher: teacher,
      signatureName: state.signatureName,
      classroom: state.classroom,
      color: state.color,
      timeIn: state.timeIn,
      timeOut: state.timeOut);
}

Stream<CRUDsignatureState> _addTimeOfDayIn(
    TimeOfDay timeIn, CRUDsignatureState state) async* {
  yield CRUDsignatureState(
      teacher: state.teacher,
      signatureName: state.signatureName,
      classroom: state.classroom,
      color: state.color,
      timeIn: timeIn,
      timeOut: state.timeOut);
}

Stream<CRUDsignatureState> _addTimeOfDayOut(
    TimeOfDay timeOut, CRUDsignatureState state) async* {
  yield CRUDsignatureState(
      teacher: state.teacher,
      signatureName: state.signatureName,
      classroom: state.classroom,
      color: state.color,
      timeIn: state.timeIn,
      timeOut: timeOut);
}

Stream<CRUDsignatureState> _addRoom(
    ClassroomModel classroom, CRUDsignatureState state) async* {
  yield CRUDsignatureState(
      classroom: classroom,
      teacher: state.teacher,
      signatureName: state.signatureName,
      color: state.color,
      timeIn: state.timeIn,
      timeOut: state.timeOut);
}

Stream<CRUDsignatureState> _addColor(
    Color? color, CRUDsignatureState state) async* {
  yield CRUDsignatureState(
      classroom: state.classroom,
      teacher: state.teacher,
      signatureName: state.signatureName,
      color: color,
      timeIn: state.timeIn,
      timeOut: state.timeOut);
}

Stream<CRUDsignatureState> _clean() async* {
  yield CRUDsignatureState(
      signatureName: null,
      teacher: null,
      classroom: null,
      color: AppColorLight.second,
      timeIn: TimeOfDay(hour: 0, minute: 0),
      timeOut: TimeOfDay(hour: 0, minute: 0));
}

Stream<CRUDsignatureState> _addItemScheduleModel(
    ItemScheduleModel itemScheduleModel) async* {
  yield CRUDsignatureState(
      signatureName: itemScheduleModel.name,
      teacher: itemScheduleModel.teacher,
      classroom: itemScheduleModel.classroom,
      color: itemScheduleModel.color,
      timeIn: itemScheduleModel.timeIn,
      timeOut: itemScheduleModel.timeOut);
}
