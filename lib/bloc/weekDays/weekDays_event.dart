part of 'weekDays_bloc.dart';

@immutable
abstract class WeekDaysEvent {}

class EditDayState extends WeekDaysEvent {
  final int position;

  EditDayState(this.position);
}

class EditDayVisible extends WeekDaysEvent {
  final bool visible;
  final int position;

  EditDayVisible(this.visible, this.position);
}

class CurrentDay extends WeekDaysEvent {}

class LoadDays extends WeekDaysEvent {}

class UpdateWeekDaysStore extends WeekDaysEvent {}
