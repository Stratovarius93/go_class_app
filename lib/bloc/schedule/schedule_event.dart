part of 'schedule_bloc.dart';

@immutable
abstract class ScheduleEvent {}

class LoadSchedule extends ScheduleEvent {}

class AddSchedule extends ScheduleEvent {
  final int? currentDay;
  final ItemScheduleModel schedule;

  AddSchedule(this.schedule, this.currentDay);
}

class EditSchedule extends ScheduleEvent {
  final int? currentDay;
  final int? position;
  final ItemScheduleModel newSchedule;

  EditSchedule(this.position, this.newSchedule, this.currentDay);
}

class RemoveSchedule extends ScheduleEvent {
  final int currentDay;
  final int position;

  RemoveSchedule(this.position, this.currentDay);
}

class RemoveScheduleSignature extends ScheduleEvent {
  final SignatureModel signature;

  RemoveScheduleSignature(this.signature);
}

class SortScheduleList extends ScheduleEvent {}

class EditScheduleVisible extends ScheduleEvent {
  final bool visible;
  final int position;

  EditScheduleVisible(this.visible, this.position);
}
