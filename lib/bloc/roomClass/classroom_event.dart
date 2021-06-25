part of 'classroom_bloc.dart';

@immutable
abstract class ClassroomEvent {}

class Loadclassroom extends ClassroomEvent {}

class Addclassroom extends ClassroomEvent {
  final ClassroomModel classroom;

  Addclassroom(this.classroom);
}

class Editclassroom extends ClassroomEvent {
  final int position;
  final ClassroomModel newclassroom;

  Editclassroom(this.position, this.newclassroom);
}

class Removeclassroom extends ClassroomEvent {
  final int position;

  Removeclassroom(this.position);
}
