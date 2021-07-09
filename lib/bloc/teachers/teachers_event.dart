part of 'teachers_bloc.dart';

@immutable
abstract class TeacherEvent {}

class LoadTeacherList extends TeacherEvent {}

class AddTeacher extends TeacherEvent {
  final TeacherModel teacher;

  AddTeacher(this.teacher);
}

class EditTeacher extends TeacherEvent {
  final String id;
  final TeacherModel newTeacher;

  EditTeacher(this.id, this.newTeacher);
}

class RemoveTeacher extends TeacherEvent {
  final String id;

  RemoveTeacher(this.id);
}
