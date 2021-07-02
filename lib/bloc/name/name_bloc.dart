import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:go_class_app/data/userName_store.dart';
import 'package:meta/meta.dart';

part 'name_event.dart';
part 'name_state.dart';

class NameBloc extends Bloc<NameEvent, NameState> {
  NameBloc() : super(NameState());

  @override
  Stream<NameState> mapEventToState(
    NameEvent event,
  ) async* {
    if (event is AddName) {
      yield* _addName(event.name);
    } else if (event is ChangeName) {
      yield* _editName(event.newName);
    } else if (event is LoadName) {
      yield* _loadName();
    }
  }
}

Stream<NameState> _loadName() async* {
  await UsernameStore.instance.init();
  String _name = UsernameStore.instance.username;
  yield NameState(name: _name);
}

Stream<NameState> _addName(String name) async* {
  await UsernameStore.instance.add(name);
  yield NameState(name: name);
}

Stream<NameState> _editName(String newName) async* {
  await UsernameStore.instance.add(newName);
  yield NameState(name: newName);
}
