import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:go_class_app/data/daysWeek_data.dart';
import 'package:go_class_app/models/day_model.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'weekDays_event.dart';
part 'weekDays_state.dart';

class WeekDaysBloc extends Bloc<WeekDaysEvent, WeekDaysState> {
  WeekDaysBloc() : super(WeekDaysState());

  @override
  Stream<WeekDaysState> mapEventToState(
    WeekDaysEvent event,
  ) async* {
    if (event is EditDayState) {
      yield* _editDayState(event.position);
    } else if (event is EditDayVisible) {
      yield* _editDayVisible(event.visible, event.position);
    } else if (event is CurrentDay) {
      yield* _currentDay();
    } else if (event is LoadDays) {
      yield* _loadWeekDays(state);
    }
  }
}

Stream<WeekDaysState> _loadWeekDays(WeekDaysState state) async* {
  List<DayModel> _weekList = _listVisible();
  yield WeekDaysState(currentDay: state.currentDay, daysList: _weekList);
}

Stream<WeekDaysState> _editDayState(int position) async* {
  List<DayModel> _weekList = _listVisible();
  for (var i = 0, len = _weekList.length; i < len; ++i) {
    if (i == position) {
      _weekList[i].enable = true;
    } else {
      _weekList[i].enable = false;
    }
  }
  _updateList(_weekList);
  _weekList = _listVisible();
  yield WeekDaysState(daysList: _weekList, currentDay: position);
}

Stream<WeekDaysState> _editDayVisible(bool visible, int position) async* {
  weekList[position].visible = visible;
  weekList.forEach((element) {
    element.enable = false;
  });
  List<DayModel> _weekList = _listVisible();
  yield WeekDaysState(daysList: _weekList, currentDay: null);
}

Stream<WeekDaysState> _currentDay() async* {
  String _currentDay;
  int? _positionDay;
  var _date = DateTime.now();
  initializeDateFormatting();
  _currentDay = DateFormat.EEEE('es_ES').format(_date);
  List<DayModel> _weekList = _listVisible();
  for (var i = 0, len = weekList.length; i < len; ++i) {
    if (weekList[i].name.toUpperCase() == _currentDay.toUpperCase()) {
      if (weekList[i].visible) {
        weekList[i].enable = true;
        _positionDay = i;
      } else {
        if (_weekList.length > 0) {
          weekList[0].enable = true;
          _positionDay = 0;
        }
      }
    } else {
      weekList[i].enable = false;
    }
  }
  _weekList = _listVisible();
  yield WeekDaysState(daysList: _weekList, currentDay: _positionDay);
}

List<DayModel> _listVisible() {
  List<DayModel> _newList = [];
  for (var i = 0, len = weekList.length; i < len; ++i) {
    if (weekList[i].visible) {
      _newList.add(weekList[i]);
    }
  }
  return _newList;
}

_updateList(List<DayModel> newList) {
  for (var i = 0, len = newList.length; i < len; ++i) {
    for (var j = 0, len = weekList.length; j < len; ++j) {
      if (newList[i].name == weekList[j].name) {
        newList[i] = weekList[j];
      }
    }
  }
}
