part of 'weekDays_bloc.dart';

@immutable
abstract class WeekDaysEvent {}

class EditDayState extends WeekDaysEvent {
  final int position;

  EditDayState(this.position);
}

class EditDayVisible extends WeekDaysEvent {
  final bool visible;
  final String dayName;
  final int position;

  EditDayVisible(this.visible, this.dayName, this.position);
}

class CurrentDay extends WeekDaysEvent {}
