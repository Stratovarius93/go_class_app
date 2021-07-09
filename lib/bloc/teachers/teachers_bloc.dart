import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:go_class_app/data/store/teachers_store.dart';
import 'package:go_class_app/models/teacher/teacher_model.dart';
import 'package:meta/meta.dart';
import 'package:sembast/sembast.dart';

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
      yield* _editTeacher(event.id, event.newTeacher);
    } else if (event is RemoveTeacher) {
      yield* _removeTeacher(event.id);
    }
  }
}

Stream<TeacherState> _loadTeacherList() async* {
  List<TeacherModel> _list = await _loadList();
  yield TeacherState(listTeachers: _list);
}

Stream<TeacherState> _addTeacher(TeacherModel teacher) async* {
  await TeacherStore.instance.add(teacher);
  List<TeacherModel> _list = await _loadList();
  yield TeacherState(listTeachers: _list);
}

Stream<TeacherState> _editTeacher(String id, TeacherModel newTeacher) async* {
  Finder finder = Finder(filter: Filter.byKey(id));
  TeacherModel _newTeacher = TeacherModel(
      name: newTeacher.name,
      id: id,
      lastName: newTeacher.lastName,
      phoneNumber: newTeacher.phoneNumber);
  await TeacherStore.instance.update(_newTeacher, finder);
  List<TeacherModel> _list = await _loadList();
  yield TeacherState(listTeachers: _list);
}

Stream<TeacherState> _removeTeacher(String id) async* {
  Finder finder = Finder(filter: Filter.byKey(id));
  await TeacherStore.instance.delete(finder);
  List<TeacherModel> _list = await _loadList();
  yield TeacherState(listTeachers: _list);
}

Future<List<TeacherModel>> _loadList() async {
  Finder finder = Finder(sortOrders: [SortOrder('name')]);
  List<TeacherModel> _list = [];
  _list = await TeacherStore.instance.find(finder: finder);
  return _list;
}
