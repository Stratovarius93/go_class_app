import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:go_class_app/data/store/teachers_store.dart';
import 'package:go_class_app/models/teacher_model.dart';
import 'package:meta/meta.dart';

part 'teachers_event.dart';
part 'teachers_state.dart';

class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  TeacherBloc() : super(TeacherState());

  @override
  Stream<TeacherState> mapEventToState(
    TeacherEvent event,
  ) async* {
    if (event is LoadTeacherList) {
      yield* _loadTeacherList();
    } else if (event is AddTeacher) {
      yield* _addTeacher(event.teacher);
    } else if (event is EditTeacher) {
      yield* _editTeacher(event.position!, event.newTeacher);
    } else if (event is RemoveTeacher) {
      yield* _removeTeacher(event.position);
    }
  }
}

Stream<TeacherState> _loadTeacherList() async* {
  yield TeacherState(listTeachers: teachersList);
}

Stream<TeacherState> _addTeacher(TeacherModel teacher) async* {
  teachersList.add(teacher);
  yield TeacherState(listTeachers: teachersList);
}

Stream<TeacherState> _editTeacher(int position, TeacherModel teacher) async* {
  teachersList[position] = teacher;
  yield TeacherState(listTeachers: teachersList);
}

Stream<TeacherState> _removeTeacher(int position) async* {
  teachersList.removeAt(position);
  yield TeacherState(listTeachers: teachersList);
}
