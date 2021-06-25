part of 'signatures_bloc.dart';

@immutable
abstract class SignaturesEvent {}

class LoadSignature extends SignaturesEvent {}

class AddSignature extends SignaturesEvent {
  final SignatureModel signature;

  AddSignature(this.signature);
}

class EditSignature extends SignaturesEvent {
  final int position;
  final SignatureModel newSignature;

  EditSignature(this.position, this.newSignature);
}

class RemoveSignature extends SignaturesEvent {
  final int position;

  RemoveSignature(this.position);
}
