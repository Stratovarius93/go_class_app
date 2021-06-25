import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:go_class_app/data/signaturesName.dart';
import 'package:go_class_app/models/signature_model.dart';
import 'package:meta/meta.dart';

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
      yield* _editSignature(event.position, event.newSignature);
    } else if (event is RemoveSignature) {
      yield* _removeSignature(event.position);
    } else if (event is LoadSignature) {
      yield* _loadSignature();
    }
  }
}

Stream<SignaturesState> _addSignature(SignatureModel signature) async* {
  signaturesNameList.add(signature);
  yield SignaturesState(listSignatures: signaturesNameList);
}

Stream<SignaturesState> _editSignature(
    int position, SignatureModel newSignature) async* {
  for (var i = 0, len = signaturesNameList.length; i < len; ++i) {
    if (i == position) {
      signaturesNameList[i] = newSignature;
    }
  }
  yield SignaturesState(listSignatures: signaturesNameList);
}

Stream<SignaturesState> _removeSignature(int position) async* {
  signaturesNameList.removeAt(position);
  yield SignaturesState(listSignatures: signaturesNameList);
}

Stream<SignaturesState> _loadSignature() async* {
  yield SignaturesState(listSignatures: signaturesNameList);
}
