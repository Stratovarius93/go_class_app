import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:go_class_app/data/roomClasses.dart';
import 'package:go_class_app/data/signatures.dart';
import 'package:go_class_app/data/signaturesName.dart';
import 'package:go_class_app/data/teachers.dart';
import 'package:go_class_app/models/itemSchedule_model.dart';
import 'package:go_class_app/models/room_model.dart';
import 'package:go_class_app/models/signature_model.dart';
import 'package:go_class_app/models/teacher_model.dart';
import 'package:meta/meta.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(ScheduleState());

  @override
  Stream<ScheduleState> mapEventToState(
    ScheduleEvent event,
  ) async* {
    if (event is LoadSchedule) {
      yield* _loadSchedule();
    } else if (event is AddSchedule) {
      yield* _addSchedule(event.currentDay!, event.schedule);
    } else if (event is EditSchedule) {
      yield* _editSchedule(event.currentDay!, event.position!, event.newSchedule);
    } else if (event is RemoveSchedule) {
      yield* _removeSchedule(event.currentDay, event.position);
    } else if (event is RemoveScheduleTeacher) {
      yield* _removeScheduleTeacher(event.position);
    } else if (event is RemoveScheduleSignature) {
      yield* _removeScheduleSignature(event.position);
    } else if (event is RemoveScheduleClassroom) {
      yield* _removeScheduleClassroom(event.position);
    } else if (event is EditScheduleTeacher) {
      yield* _editScheduleTeacher(event.lastTeacher, event.newTeacher);
    } else if (event is EditScheduleSignatureName) {
      yield* _editScheduleSignature(event.lastSignature, event.newSignature);
    } else if (event is EditScheduleClassroom) {
      yield* _editScheduleClassroom(event.lastClassroom, event.newClassroom);
    } else if (event is SortScheduleList) {
      yield* _sortList();
    }
  }
}

Stream<ScheduleState> _loadSchedule() async* {
  yield ScheduleState(scheduleList: scheduleListGeneral);
}

Stream<ScheduleState> _addSchedule(
    int currentDay, ItemScheduleModel schedule) async* {
  scheduleListGeneral[currentDay].add(schedule);
  yield ScheduleState(scheduleList: scheduleListGeneral);
}

Stream<ScheduleState> _editSchedule(
    int currentDay, int position, ItemScheduleModel schedule) async* {
  scheduleListGeneral[currentDay][position] = schedule;
  yield ScheduleState(scheduleList: scheduleListGeneral);
}

Stream<ScheduleState> _removeSchedule(int currentDay, int position) async* {
  scheduleListGeneral[currentDay].removeAt(position);
  yield ScheduleState(scheduleList: scheduleListGeneral);
}

Stream<ScheduleState> _removeScheduleTeacher(int position) async* {
  TeacherModel _teacher = _teacherByPosition(position);
  for (var i = 0, len = scheduleListGeneral.length; i < len; ++i) {
    for (var j = 0, len = scheduleListGeneral[i].length; j < len; ++j) {
      if (scheduleListGeneral[i][j].teacher == _teacher) {
        scheduleListGeneral[i][j].teacher = null;
      }
    }
  }
  yield ScheduleState(scheduleList: scheduleListGeneral);
}

Stream<ScheduleState> _editScheduleTeacher(
    TeacherModel? lastTeacher, TeacherModel newTeacher) async* {
  for (var i = 0, len = scheduleListGeneral.length; i < len; ++i) {
    for (var j = 0, len = scheduleListGeneral[i].length; j < len; ++j) {
      if (scheduleListGeneral[i][j].teacher == lastTeacher) {
        scheduleListGeneral[i][j].teacher = newTeacher;
      }
    }
  }
  yield ScheduleState(scheduleList: scheduleListGeneral);
}

Stream<ScheduleState> _removeScheduleSignature(int position) async* {
  SignatureModel _signature = _signatureByPosition(position);
  for (var i = 0, len = scheduleListGeneral.length; i < len; ++i) {
    for (var j = 0, len = scheduleListGeneral[i].length; j < len; ++j) {
      if (scheduleListGeneral[i][j].name == _signature) {
        scheduleListGeneral[i].removeAt(j);
      }
    }
  }
  yield ScheduleState(scheduleList: scheduleListGeneral);
}

Stream<ScheduleState> _editScheduleSignature(
    SignatureModel lastSignature, SignatureModel newSignature) async* {
  for (var i = 0, len = scheduleListGeneral.length; i < len; ++i) {
    for (var j = 0, len = scheduleListGeneral[i].length; j < len; ++j) {
      if (scheduleListGeneral[i][j].name == lastSignature) {
        scheduleListGeneral[i][j].name = newSignature;
      }
    }
  }
  yield ScheduleState(scheduleList: scheduleListGeneral);
}

Stream<ScheduleState> _removeScheduleClassroom(int position) async* {
  ClassroomModel _classroom = _classroomByPosition(position);
  for (var i = 0, len = scheduleListGeneral.length; i < len; ++i) {
    for (var j = 0, len = scheduleListGeneral[i].length; j < len; ++j) {
      if (scheduleListGeneral[i][j].classroom == _classroom) {
        scheduleListGeneral[i][j].classroom = null;
      }
    }
  }
  yield ScheduleState(scheduleList: scheduleListGeneral);
}

Stream<ScheduleState> _editScheduleClassroom(
    ClassroomModel lastClassroom, ClassroomModel newClassroom) async* {
  for (var i = 0, len = scheduleListGeneral.length; i < len; ++i) {
    for (var j = 0, len = scheduleListGeneral[i].length; j < len; ++j) {
      if (scheduleListGeneral[i][j].classroom == lastClassroom) {
        scheduleListGeneral[i][j].classroom = newClassroom;
      }
    }
  }
  yield ScheduleState(scheduleList: scheduleListGeneral);
}

Stream<ScheduleState> _sortList() async* {
  for (var i = 0, len = scheduleListGeneral.length; i < len; ++i) {
    scheduleListGeneral[i]
        .sort((a, b) => a.timeIn.hour.compareTo(b.timeIn.hour));
  }
  yield ScheduleState(scheduleList: scheduleListGeneral);
}

TeacherModel _teacherByPosition(int position) => teachersList[position];

SignatureModel _signatureByPosition(int position) =>
    signaturesNameList[position];

ClassroomModel _classroomByPosition(int position) => classroomList[position];
