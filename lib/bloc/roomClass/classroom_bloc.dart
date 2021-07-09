import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:go_class_app/data/store/classroom_store.dart';
import 'package:go_class_app/models/classroom/room_model.dart';
import 'package:meta/meta.dart';
import 'package:sembast/sembast.dart';

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
      yield* _editclassroom(event.id, event.newclassroom);
    } else if (event is Removeclassroom) {
      yield* _removeclassroom(event.id);
    }
  }
}

Stream<ClassroomState> _loadclassroom() async* {
  List<ClassroomModel> _list = await _loadList();
  yield ClassroomState(listclassroom: _list);
}

Stream<ClassroomState> _addclassroom(ClassroomModel classroom) async* {
  await ClassroomStore.instance.add(classroom);
  List<ClassroomModel> _list = await _loadList();
  yield ClassroomState(listclassroom: _list);
}

Stream<ClassroomState> _editclassroom(
    String id, ClassroomModel newclassroom) async* {
  Finder finder = Finder(filter: Filter.byKey(id));
  ClassroomModel _newClassroom = ClassroomModel(
      id: id,
      name: newclassroom.name,
      description: newclassroom.description,
      type: newclassroom.type);
  await ClassroomStore.instance.update(_newClassroom, finder);
  List<ClassroomModel> _list = await _loadList();
  yield ClassroomState(listclassroom: _list);
}

Stream<ClassroomState> _removeclassroom(String id) async* {
  Finder finder = Finder(filter: Filter.byKey(id));
  await ClassroomStore.instance.delete(finder);
  List<ClassroomModel> _list = await _loadList();
  yield ClassroomState(listclassroom: _list);
}

Future<List<ClassroomModel>> _loadList() async {
  List<ClassroomModel> _list = [];
  Finder finder = Finder(sortOrders: [SortOrder('name')]);
  _list = await ClassroomStore.instance.find(finder: finder);
  return _list;
}
