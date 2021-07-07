part of 'signatures_bloc.dart';

@immutable
abstract class SignaturesEvent {}

class LoadSignature extends SignaturesEvent {}

class AddSignature extends SignaturesEvent {
  final SignatureModel signature;

  AddSignature(this.signature);
}

class EditSignature extends SignaturesEvent {
  final SignatureModel oldSignature;
  final SignatureModel newSignature;

  EditSignature(this.oldSignature, this.newSignature);
}

class RemoveSignature extends SignaturesEvent {
  final SignatureModel signature;

  RemoveSignature(this.signature);
}
