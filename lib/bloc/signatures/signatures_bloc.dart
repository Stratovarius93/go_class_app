import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:go_class_app/data/store/signaturesName_store.dart';
import 'package:go_class_app/models/signature_model.dart';
import 'package:meta/meta.dart';
import 'package:min_id/min_id.dart';
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
  Finder finder = Finder(sortOrders: [SortOrder('name')]);
  signaturesNameList = await SignatureNameStore.instance.find(finder: finder);
  print(signaturesNameList.length);
  for (var i = 0, len = signaturesNameList.length; i < len; ++i) {
    print('${signaturesNameList[i].id} - ${signaturesNameList[i].name}');
  }
  if (signaturesNameList.isEmpty) {
    signaturesNameList = [];
    for (var i = 0, len = signaturesNameList.length; i < len; ++i) {
      await SignatureNameStore.instance.add(signaturesNameList[i]);
    }
  }
  yield SignaturesState(listSignatures: signaturesNameList);
}

Stream<SignaturesState> _addSignature(SignatureModel signature) async* {
  signaturesNameList.add(signature);
  final String id = MinId.getId();
  SignatureModel _newSignature = SignatureModel(id: id, name: signature.name);
  SignatureNameStore.instance.add(_newSignature);
  yield SignaturesState(listSignatures: signaturesNameList);
}

Stream<SignaturesState> _editSignature(
    SignatureModel oldSignature, SignatureModel newSignature) async* {
  Finder finder = Finder(filter: Filter.byKey(oldSignature.id));
  SignatureModel _newSignature =
      SignatureModel(id: oldSignature.id, name: newSignature.name);

  await SignatureNameStore.instance.update(_newSignature, finder);
  for (SignatureModel item in signaturesNameList) {
    if (item.id == oldSignature.id) {
      item = _newSignature;
    }
  }
  yield SignaturesState(listSignatures: signaturesNameList);
}

Stream<SignaturesState> _removeSignature(SignatureModel signature) async* {
  Finder finder = Finder(filter: Filter.byKey(signature.id));
  await SignatureNameStore.instance.delete(finder);
  signaturesNameList.remove(signature);
  yield SignaturesState(listSignatures: signaturesNameList);
}
