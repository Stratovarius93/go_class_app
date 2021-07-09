part of 'classroom_bloc.dart';

@immutable
abstract class ClassroomEvent {}

class Loadclassroom extends ClassroomEvent {}

class Addclassroom extends ClassroomEvent {
  final ClassroomModel classroom;

  Addclassroom(this.classroom);
}

class Editclassroom extends ClassroomEvent {
  final String id;
  final ClassroomModel newclassroom;

  Editclassroom(this.id, this.newclassroom);
}

class Removeclassroom extends ClassroomEvent {
  final String id;

  Removeclassroom(this.id);
}
