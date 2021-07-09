import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:go_class_app/data/store/signaturesName_store.dart';
import 'package:go_class_app/models/signature/signature_model.dart';
import 'package:meta/meta.dart';
import 'package:sembast/sembast.dart';

part 'signatures_event.dart';
part 'signatures_state.dart';

class SignaturesBloc extends Bloc<SignaturesEvent, SignaturesState> {
  SignaturesBloc() : super(SignaturesState());

  @override
  Stream<SignaturesState> mapEventToState(
    SignaturesEvent event,
  ) async* {
    if (event is AddSignature) {
      yield* _addSignature(event.signature);
    } else if (event is EditSignature) {
      yield* _editSignature(event.oldSignature, event.newSignature);
    } else if (event is RemoveSignature) {
      yield* _removeSignature(event.signature);
    } else if (event is LoadSignature) {
      yield* _loadSignature();
    }
  }
}

Stream<SignaturesState> _loadSignature() async* {
  List<SignatureModel> _list = await _loadList();
  yield SignaturesState(listSignatures: _list);
}

Stream<SignaturesState> _addSignature(SignatureModel signature) async* {
  await SignatureNameStore.instance.add(signature);
  List<SignatureModel> _list = await _loadList();
  yield SignaturesState(listSignatures: _list);
}

Stream<SignaturesState> _editSignature(
    SignatureModel oldSignature, SignatureModel newSignature) async* {
  Finder finder = Finder(filter: Filter.byKey(oldSignature.id));
  SignatureModel _newSignature =
      SignatureModel(id: oldSignature.id, name: newSignature.name);
  await SignatureNameStore.instance.update(_newSignature, finder);
  List<SignatureModel> _list = await _loadList();
  yield SignaturesState(listSignatures: _list);
}

Stream<SignaturesState> _removeSignature(SignatureModel signature) async* {
  Finder finder = Finder(filter: Filter.byKey(signature.id));
  await SignatureNameStore.instance.delete(finder);
  List<SignatureModel> _list = await _loadList();
  yield SignaturesState(listSignatures: _list);
}

Future<List<SignatureModel>> _loadList() async {
  List<SignatureModel> _list = [];
  Finder finder = Finder(sortOrders: [SortOrder('name')]);
  _list = await SignatureNameStore.instance.find(finder: finder);
  return _list;
}
