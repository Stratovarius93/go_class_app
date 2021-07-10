import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:go_class_app/data/store/schedule_store.dart';
import 'package:go_class_app/models/daySchedule/daySchedule_model.dart';
import 'package:go_class_app/models/itemSchedule/itemSchedule_model.dart';
import 'package:go_class_app/models/signature/signature_model.dart';
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
      yield* _addSchedule(event.currentDay!, event.schedule, state);
    } else if (event is EditSchedule) {
      yield* _editSchedule(
          event.currentDay!, event.position!, event.newSchedule);
    } else if (event is RemoveSchedule) {
      yield* _removeSchedule(event.currentDay, event.position);
    } else if (event is RemoveScheduleSignature) {
      yield* _removeScheduleSignature(event.signature);
    } else if (event is SortScheduleList) {
      yield* _sortList();
    } else if (event is EditScheduleVisible) {
      yield* _editScheduleVisible(event.visible, event.position);
    } else if (event is RemoveScheduleList) {
      yield* _removeScheduleList();
    }
  }
}

Stream<ScheduleState> _loadSchedule() async* {
  List<DayScheduleModel> _preList = await ScheduleStore.instance.find();
  if (_preList.isEmpty) {
    for (var i = 0, len = _scheduleListGeneralData.length; i < len; ++i) {
      await ScheduleStore.instance.add(_scheduleListGeneralData[i]);
    }
    _preList = await ScheduleStore.instance.find();
  }

  List<DayScheduleModel> _list = _listVisible(_preList);
  yield ScheduleState(scheduleList: _list);
}

Stream<ScheduleState> _addSchedule(
    int currentDay, ItemScheduleModel schedule, ScheduleState state) async* {
  state.scheduleList[currentDay].scheduleList.add(schedule);
  List<DayScheduleModel> _preList = await ScheduleStore.instance.find();
  List<DayScheduleModel> _updatedList =
      _updateList(newList: state.scheduleList, oldList: _preList);
  List<DayScheduleModel> _finalList = await _updateListStore(_updatedList);
  List<DayScheduleModel> _finalList2 = _listVisible(_finalList);

  yield ScheduleState(scheduleList: _finalList2);
}

Stream<ScheduleState> _editSchedule(
    int currentDay, int position, ItemScheduleModel schedule) async* {
  List<DayScheduleModel> _preList = await ScheduleStore.instance.find();
  List<DayScheduleModel> _list = _listVisible(_preList);
  _list[currentDay].scheduleList[position] = schedule;
  List<DayScheduleModel> _updatedList =
      _updateList(newList: _list, oldList: _preList);
  List<DayScheduleModel> _finalList = await _updateListStore(_updatedList);
  List<DayScheduleModel> _finalList2 = _listVisible(_finalList);

  yield ScheduleState(scheduleList: _finalList2);
}

Stream<ScheduleState> _removeSchedule(int currentDay, int position) async* {
  List<DayScheduleModel> _preList = await ScheduleStore.instance.find();
  List<DayScheduleModel> _list = _listVisible(_preList);
  _list[currentDay].scheduleList.removeAt(position);
  List<DayScheduleModel> _updatedList =
      _updateList(newList: _list, oldList: _preList);
  List<DayScheduleModel> _finalList = await _updateListStore(_updatedList);
  List<DayScheduleModel> _finalList2 = _listVisible(_finalList);

  yield ScheduleState(scheduleList: _finalList2);
}

Stream<ScheduleState> _removeScheduleSignature(
    SignatureModel signature) async* {
  List<DayScheduleModel> _preList = await ScheduleStore.instance.find();
  for (var i = 0, len = _preList.length; i < len; ++i) {
    _preList[i]
        .scheduleList
        .removeWhere((element) => element.idSignature == signature.id);
  }
  List<DayScheduleModel> _finalList = await _updateListStore(_preList);
  List<DayScheduleModel> _finalList2 = _listVisible(_finalList);

  yield ScheduleState(scheduleList: _finalList2);
}

Stream<ScheduleState> _sortList() async* {
  List<DayScheduleModel> _preList = await ScheduleStore.instance.find();
  for (var i = 0, len = _preList.length; i < len; ++i) {
    _preList[i]
        .scheduleList
        .sort((a, b) => a.timeIn.hour.compareTo(b.timeIn.hour));
  }
  List<DayScheduleModel> _finalList2 = _listVisible(_preList);
  yield ScheduleState(scheduleList: _finalList2);
}

Stream<ScheduleState> _editScheduleVisible(bool visible, int position) async* {
  List<DayScheduleModel> _preList = await ScheduleStore.instance.find();
  _preList[position].visible = visible;
  List<DayScheduleModel> _finalList = await _updateListStore(_preList);
  List<DayScheduleModel> _finalList2 = _listVisible(_finalList);
  yield ScheduleState(scheduleList: _finalList2);
}

Stream<ScheduleState> _removeScheduleList() async* {
  await ScheduleStore.instance.delete();
  List<DayScheduleModel> _preList = await ScheduleStore.instance.find();
  if (_preList.isEmpty) {
    for (var i = 0, len = _scheduleListGeneralData.length; i < len; ++i) {
      await ScheduleStore.instance.add(_scheduleListGeneralData[i]);
    }
    _preList = await ScheduleStore.instance.find();
  }

  List<DayScheduleModel> _list = _listVisible(_preList);

  yield ScheduleState(scheduleList: _list);
}

List<DayScheduleModel> _listVisible(List<DayScheduleModel> list) {
  List<DayScheduleModel> _newList = [];
  for (var i = 0, len = list.length; i < len; ++i) {
    if (list[i].visible) {
      _newList.add(list[i]);
    }
  }
  return _newList;
}

List<DayScheduleModel> _updateList(
    {List<DayScheduleModel>? newList, List<DayScheduleModel>? oldList}) {
  for (var i = 0, len = newList!.length; i < len; ++i) {
    for (var j = 0, len = oldList!.length; j < len; ++j) {
      if (newList[i].day == oldList[j].day) {
        oldList[j] = newList[i];
      }
    }
  }
  return oldList!;
}

Future<List<DayScheduleModel>> _updateListStore(
    List<DayScheduleModel> list) async {
  for (var i = 0, len = list.length; i < len; ++i) {
    await ScheduleStore.instance.update(list[i]);
  }
  List<DayScheduleModel> _list = await ScheduleStore.instance.find();
  return _list;
}

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
