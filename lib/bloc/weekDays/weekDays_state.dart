part of 'weekDays_bloc.dart';

class WeekDaysState {
  final List<DayModel> daysList;
  final int? currentDay;

  WeekDaysState({this.currentDay, this.daysList = const []});
}
