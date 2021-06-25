part of 'teachers_bloc.dart';

@immutable
abstract class TeacherEvent {}

class LoadTeacherList extends TeacherEvent {}

class AddTeacher extends TeacherEvent {
  final TeacherModel teacher;

  AddTeacher(this.teacher);
}

class EditTeacher extends TeacherEvent {
  final int? position;
  final TeacherModel newTeacher;

  EditTeacher(this.position, this.newTeacher);
}

class RemoveTeacher extends TeacherEvent {
  final int position;

  RemoveTeacher(this.position);
}
