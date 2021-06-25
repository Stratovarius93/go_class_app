import 'dart:async';

import 'package:bloc/bloc.dart';
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
    }
  }
}

Stream<NameState> _addName(String name) async* {
  yield NameState(name: name);
}

Stream<NameState> _editName(String newName) async* {
  yield NameState(name: newName);
}
