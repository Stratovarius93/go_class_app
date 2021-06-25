part of 'name_bloc.dart';

@immutable
abstract class NameEvent {}

class AddName extends NameEvent {
  final String name;

  AddName(this.name);
}

class ChangeName extends NameEvent {
  final String newName;

  ChangeName(this.newName);
}
