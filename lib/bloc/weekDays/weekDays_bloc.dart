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
      yield* _editDayVisible(event.visible, event.dayName, event.position);
    } else if (event is CurrentDay) {
      yield* _currentDay();
    }
  }
}

Stream<WeekDaysState> _editDayState(int position) async* {
  for (var i = 0, len = weekList.length; i < len; ++i) {
    if (i == position) {
      weekList[i].enable = true;
    } else {
      weekList[i].enable = false;
    }
  }
  yield WeekDaysState(daysList: weekList, currentDay: position);
}

Stream<WeekDaysState> _editDayVisible(
    bool visible, String dayName, int position) async* {
  weekList[position].visible = visible;
  yield WeekDaysState(daysList: weekList, currentDay: position);
}

Stream<WeekDaysState> _currentDay() async* {
  String _currentDay;
  int? _positionDay;
  var _date = DateTime.now();
  initializeDateFormatting();
  _currentDay = DateFormat.EEEE('es_ES').format(_date);
  for (var i = 0, len = weekList.length; i < len; ++i) {
    if (weekList[i].name.toUpperCase() == _currentDay.toUpperCase()) {
      weekList[i].enable = true;
      _positionDay = i;
    } else {
      weekList[i].enable = false;
    }
  }
  yield WeekDaysState(daysList: weekList, currentDay: _positionDay);
}
