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

class RemoveScheduleTeacher extends ScheduleEvent {
  final int position;

  RemoveScheduleTeacher(this.position);
}

class RemoveScheduleSignature extends ScheduleEvent {
  final int position;

  RemoveScheduleSignature(this.position);
}

class RemoveScheduleClassroom extends ScheduleEvent {
  final int position;

  RemoveScheduleClassroom(this.position);
}

class EditScheduleTeacher extends ScheduleEvent {
  final TeacherModel? lastTeacher;
  final TeacherModel newTeacher;

  EditScheduleTeacher(this.lastTeacher, this.newTeacher);
}

class EditScheduleClassroom extends ScheduleEvent {
  final ClassroomModel lastClassroom;
  final ClassroomModel newClassroom;

  EditScheduleClassroom(this.lastClassroom, this.newClassroom);
}

class EditScheduleSignatureName extends ScheduleEvent {
  final SignatureModel lastSignature;
  final SignatureModel newSignature;

  EditScheduleSignatureName(this.lastSignature, this.newSignature);
}

class SortScheduleList extends ScheduleEvent {}
