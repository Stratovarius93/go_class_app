import 'package:go_class_app/models/signature/signature_model.dart';

SignatureModel signatureByID(
    {String? id, List<SignatureModel>? signatureList}) {
  SignatureModel _signature = SignatureModel(name: '');
  for (var i = 0, len = signatureList!.length; i < len; ++i) {
    if (signatureList[i].id == id) {
      _signature = signatureList[i];
    }
  }
  return _signature;
}

bool findSignature({String? id, List<SignatureModel>? signatureList}) {
  bool _find = false;
  if (id != null) {
    for (var i = 0, len = signatureList!.length; i < len; ++i) {
      if (signatureList[i].id == id) {
        _find = true;
      }
    }
  } else {
    _find = false;
  }
  return _find;
}
