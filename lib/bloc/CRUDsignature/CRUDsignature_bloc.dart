import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_class_app/models/itemSchedule/itemSchedule_model.dart';
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
      yield* _addSignature(event.signatureId, state);
    } else if (event is CRUDAddTeacher) {
      yield* _addTeacher(event.teacherId, state);
    } else if (event is CRUDAddTimeOfDayIn) {
      yield* _addTimeOfDayIn(event.timeIn, state);
    } else if (event is CRUDAddTimeOfDayOut) {
      yield* _addTimeOfDayOut(event.timeOut, state);
    } else if (event is CRUDAddRoom) {
      yield* _addRoom(event.classroomId, state);
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
    String signatureId, CRUDsignatureState state) async* {
  yield CRUDsignatureState(
      signatureId: signatureId,
      teacherId: state.teacherId,
      classroomId: state.classroomId,
      color: state.color,
      timeIn: state.timeIn,
      timeOut: state.timeOut);
}

Stream<CRUDsignatureState> _addTeacher(
    String teacherId, CRUDsignatureState state) async* {
  yield CRUDsignatureState(
      teacherId: teacherId,
      signatureId: state.signatureId,
      classroomId: state.classroomId,
      color: state.color,
      timeIn: state.timeIn,
      timeOut: state.timeOut);
}

Stream<CRUDsignatureState> _addTimeOfDayIn(
    TimeOfDay timeIn, CRUDsignatureState state) async* {
  yield CRUDsignatureState(
      teacherId: state.teacherId,
      signatureId: state.signatureId,
      classroomId: state.classroomId,
      color: state.color,
      timeIn: timeIn,
      timeOut: state.timeOut);
}

Stream<CRUDsignatureState> _addTimeOfDayOut(
    TimeOfDay timeOut, CRUDsignatureState state) async* {
  yield CRUDsignatureState(
      teacherId: state.teacherId,
      signatureId: state.signatureId,
      classroomId: state.classroomId,
      color: state.color,
      timeIn: state.timeIn,
      timeOut: timeOut);
}

Stream<CRUDsignatureState> _addRoom(
    String classroomId, CRUDsignatureState state) async* {
  yield CRUDsignatureState(
      classroomId: classroomId,
      teacherId: state.teacherId,
      signatureId: state.signatureId,
      color: state.color,
      timeIn: state.timeIn,
      timeOut: state.timeOut);
}

Stream<CRUDsignatureState> _addColor(
    int? color, CRUDsignatureState state) async* {
  yield CRUDsignatureState(
      classroomId: state.classroomId,
      teacherId: state.teacherId,
      signatureId: state.signatureId,
      color: color,
      timeIn: state.timeIn,
      timeOut: state.timeOut);
}

Stream<CRUDsignatureState> _clean() async* {
  yield CRUDsignatureState(
      signatureId: null,
      teacherId: null,
      classroomId: null,
      color: 1,
      timeIn: TimeOfDay(hour: 0, minute: 0),
      timeOut: TimeOfDay(hour: 0, minute: 0));
}

Stream<CRUDsignatureState> _addItemScheduleModel(
    ItemScheduleModel itemScheduleModel) async* {
  yield CRUDsignatureState(
      signatureId: itemScheduleModel.idSignature,
      teacherId: itemScheduleModel.idTeacher,
      classroomId: itemScheduleModel.idClassroom,
      color: itemScheduleModel.color,
      timeIn: itemScheduleModel.timeIn,
      timeOut: itemScheduleModel.timeOut);
}
