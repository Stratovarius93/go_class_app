import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:go_class_app/data/roomClasses.dart';
import 'package:go_class_app/models/room_model.dart';
import 'package:meta/meta.dart';

part 'classroom_event.dart';
part 'classroom_state.dart';

class ClassroomBloc extends Bloc<ClassroomEvent, ClassroomState> {
  ClassroomBloc() : super(ClassroomState());
  @override
  Stream<ClassroomState> mapEventToState(
    ClassroomEvent event,
  ) async* {
    if (event is Loadclassroom) {
      yield* _loadclassroom();
    } else if (event is Addclassroom) {
      yield* _addclassroom(event.classroom);
    } else if (event is Editclassroom) {
      yield* _editclassroom(event.position, event.newclassroom);
    } else if (event is Removeclassroom) {
      yield* _removeclassroom(event.position);
    }
  }
}

Stream<ClassroomState> _loadclassroom() async* {
  yield ClassroomState(listclassroom: classroomList);
}

Stream<ClassroomState> _addclassroom(ClassroomModel classroom) async* {
  classroomList.add(classroom);
  yield ClassroomState(listclassroom: classroomList);
}

Stream<ClassroomState> _editclassroom(
    int position, ClassroomModel newclassroom) async* {
  classroomList[position] = newclassroom;
  yield ClassroomState(listclassroom: classroomList);
}

Stream<ClassroomState> _removeclassroom(int position) async* {
  classroomList.removeAt(position);
  yield ClassroomState(listclassroom: classroomList);
}
