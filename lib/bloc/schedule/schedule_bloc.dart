import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:go_class_app/data/store/classroom_store.dart';
import 'package:go_class_app/data/store/signatures_store.dart';
import 'package:go_class_app/data/store/teachers_store.dart';
import 'package:go_class_app/models/daySchedule_model.dart';
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
      yield* _editSchedule(
          event.currentDay!, event.position!, event.newSchedule);
    } else if (event is RemoveSchedule) {
      yield* _removeSchedule(event.currentDay, event.position);
    } else if (event is RemoveScheduleTeacher) {
      yield* _removeScheduleTeacher(event.position);
    } else if (event is RemoveScheduleSignature) {
      yield* _removeScheduleSignature(event.signature);
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
    } else if (event is EditScheduleVisible) {
      yield* _editScheduleVisible(event.visible, event.position);
    } else if (event is UpdateScheduleStore) {
      yield* _updateScheduleStore();
    }
  }
}

Stream<ScheduleState> _loadSchedule() async* {
  List<ItemScheduleModel> scheduleList0 = [];

  List<ItemScheduleModel> scheduleList1 = [];

  List<ItemScheduleModel> scheduleList2 = [];

  List<ItemScheduleModel> scheduleList3 = [];

  List<ItemScheduleModel> scheduleList4 = [];

  List<ItemScheduleModel> scheduleList5 = [];

  List<ItemScheduleModel> scheduleList6 = [];

  List<DayScheduleModel> _scheduleListGeneralData = [
    DayScheduleModel(
        id: '0', scheduleList: scheduleList0, visible: true, day: 'Lunes'),
    DayScheduleModel(
        id: '1', scheduleList: scheduleList1, visible: true, day: 'Martes'),
    DayScheduleModel(
        id: '2', scheduleList: scheduleList2, visible: true, day: 'Miércoles'),
    DayScheduleModel(
        id: '3', scheduleList: scheduleList3, visible: true, day: 'Jueves'),
    DayScheduleModel(
        id: '4', scheduleList: scheduleList4, visible: true, day: 'Viernes'),
    DayScheduleModel(
        id: '5', scheduleList: scheduleList5, visible: true, day: 'Sábado'),
    DayScheduleModel(
        id: '6', scheduleList: scheduleList6, visible: true, day: 'Domingo'),
  ];
  scheduleListGeneral = await ScheduleStore.instance.find();
  if (scheduleListGeneral.isEmpty) {
    scheduleListGeneral = _scheduleListGeneralData;
    for (var i = 0, len = _scheduleListGeneralData.length; i < len; ++i) {
      await ScheduleStore.instance.add(_scheduleListGeneralData[i]);
    }
  }

  List<DayScheduleModel> _scheduleListGeneral = _listVisible();
  yield ScheduleState(scheduleList: _scheduleListGeneral);
}

Stream<ScheduleState> _addSchedule(
    int currentDay, ItemScheduleModel schedule) async* {
  List<DayScheduleModel> _scheduleListGeneral = _listVisible();
  _scheduleListGeneral[currentDay].scheduleList.add(schedule);
  _updateList(_scheduleListGeneral);
  _scheduleListGeneral = _listVisible();
  yield ScheduleState(scheduleList: _scheduleListGeneral);
}

Stream<ScheduleState> _editSchedule(
    int currentDay, int position, ItemScheduleModel schedule) async* {
  List<DayScheduleModel> _scheduleListGeneral = _listVisible();
  _scheduleListGeneral[currentDay].scheduleList[position] = schedule;
  _updateList(_scheduleListGeneral);
  _scheduleListGeneral = _listVisible();
  yield ScheduleState(scheduleList: _scheduleListGeneral);
}

Stream<ScheduleState> _removeSchedule(int currentDay, int position) async* {
  List<DayScheduleModel> _scheduleListGeneral = _listVisible();
  _scheduleListGeneral[currentDay].scheduleList.removeAt(position);
  _updateList(_scheduleListGeneral);
  _scheduleListGeneral = _listVisible();
  yield ScheduleState(scheduleList: _scheduleListGeneral);
}

Stream<ScheduleState> _removeScheduleTeacher(int position) async* {
  TeacherModel _teacher = _teacherByPosition(position);
  for (var i = 0, len = scheduleListGeneral.length; i < len; ++i) {
    for (var j = 0, len = scheduleListGeneral[i].scheduleList.length;
        j < len;
        ++j) {
      if (scheduleListGeneral[i].scheduleList[j].teacher == _teacher) {
        scheduleListGeneral[i].scheduleList[j].teacher = null;
      }
    }
  }
  List<DayScheduleModel> _scheduleListGeneral = _listVisible();
  yield ScheduleState(scheduleList: _scheduleListGeneral);
}

Stream<ScheduleState> _editScheduleTeacher(
    TeacherModel? lastTeacher, TeacherModel newTeacher) async* {
  for (var i = 0, len = scheduleListGeneral.length; i < len; ++i) {
    for (var j = 0, len = scheduleListGeneral[i].scheduleList.length;
        j < len;
        ++j) {
      if (scheduleListGeneral[i].scheduleList[j].teacher == lastTeacher) {
        scheduleListGeneral[i].scheduleList[j].teacher = newTeacher;
      }
    }
  }
  List<DayScheduleModel> _scheduleListGeneral = _listVisible();
  yield ScheduleState(scheduleList: _scheduleListGeneral);
}

Stream<ScheduleState> _removeScheduleSignature(
    SignatureModel signature) async* {
  for (var i = 0, len = scheduleListGeneral.length; i < len; ++i) {
    scheduleListGeneral[i]
        .scheduleList
        .removeWhere((element) => element.name == signature);
  }

  List<DayScheduleModel> _scheduleListGeneral = _listVisible();
  yield ScheduleState(scheduleList: _scheduleListGeneral);
}

Stream<ScheduleState> _editScheduleSignature(
    SignatureModel lastSignature, SignatureModel newSignature) async* {
  for (var i = 0, len = scheduleListGeneral.length; i < len; ++i) {
    for (var j = 0, len = scheduleListGeneral[i].scheduleList.length;
        j < len;
        ++j) {
      if (scheduleListGeneral[i].scheduleList[j].name == lastSignature) {
        scheduleListGeneral[i].scheduleList[j].name = newSignature;
      }
    }
  }
  List<DayScheduleModel> _scheduleListGeneral = _listVisible();
  yield ScheduleState(scheduleList: _scheduleListGeneral);
}

Stream<ScheduleState> _removeScheduleClassroom(int position) async* {
  ClassroomModel _classroom = _classroomByPosition(position);
  for (var i = 0, len = scheduleListGeneral.length; i < len; ++i) {
    for (var j = 0, len = scheduleListGeneral[i].scheduleList.length;
        j < len;
        ++j) {
      if (scheduleListGeneral[i].scheduleList[j].classroom == _classroom) {
        scheduleListGeneral[i].scheduleList[j].classroom = null;
      }
    }
  }
  List<DayScheduleModel> _scheduleListGeneral = _listVisible();
  yield ScheduleState(scheduleList: _scheduleListGeneral);
}

Stream<ScheduleState> _editScheduleClassroom(
    ClassroomModel lastClassroom, ClassroomModel newClassroom) async* {
  for (var i = 0, len = scheduleListGeneral.length; i < len; ++i) {
    for (var j = 0, len = scheduleListGeneral[i].scheduleList.length;
        j < len;
        ++j) {
      if (scheduleListGeneral[i].scheduleList[j].classroom == lastClassroom) {
        scheduleListGeneral[i].scheduleList[j].classroom = newClassroom;
      }
    }
  }
  List<DayScheduleModel> _scheduleListGeneral = _listVisible();
  yield ScheduleState(scheduleList: _scheduleListGeneral);
}

Stream<ScheduleState> _sortList() async* {
  for (var i = 0, len = scheduleListGeneral.length; i < len; ++i) {
    scheduleListGeneral[i]
        .scheduleList
        .sort((a, b) => a.timeIn.hour.compareTo(b.timeIn.hour));
  }
  List<DayScheduleModel> _scheduleListGeneral = _listVisible();
  yield ScheduleState(scheduleList: _scheduleListGeneral);
}

Stream<ScheduleState> _editScheduleVisible(bool visible, int position) async* {
  scheduleListGeneral[position].visible = visible;
  List<DayScheduleModel> _scheduleListGeneral = _listVisible();
  yield ScheduleState(scheduleList: _scheduleListGeneral);
}

Stream<ScheduleState> _updateScheduleStore() async* {
  for (var i = 0, len = scheduleListGeneral.length; i < len; ++i) {
    await ScheduleStore.instance.update(scheduleListGeneral[i]);
  }
  List<DayScheduleModel> _scheduleListGeneral = _listVisible();
  yield ScheduleState(scheduleList: _scheduleListGeneral);
}

TeacherModel _teacherByPosition(int position) => teachersList[position];

ClassroomModel _classroomByPosition(int position) => classroomList[position];

List<DayScheduleModel> _listVisible() {
  List<DayScheduleModel> _newList = [];
  for (var i = 0, len = scheduleListGeneral.length; i < len; ++i) {
    if (scheduleListGeneral[i].visible) {
      _newList.add(scheduleListGeneral[i]);
    }
  }
  return _newList;
}

_updateList(List<DayScheduleModel> newList) {
  for (var i = 0, len = newList.length; i < len; ++i) {
    for (var j = 0, len = scheduleListGeneral.length; j < len; ++j) {
      if (newList[i].day == scheduleListGeneral[j].day) {
        scheduleListGeneral[j] = newList[i];
      }
    }
  }
}
