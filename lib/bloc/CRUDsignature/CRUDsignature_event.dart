part of 'CRUDsignature_bloc.dart';

@immutable
abstract class CRUDsignatureEvent {}

class CRUDAddSignature extends CRUDsignatureEvent {
  final SignatureModel signatureName;

  CRUDAddSignature(this.signatureName);
}

class CRUDAddTeacher extends CRUDsignatureEvent {
  final TeacherModel teacher;

  CRUDAddTeacher(this.teacher);
}

class CRUDAddTimeOfDayIn extends CRUDsignatureEvent {
  final TimeOfDay timeIn;

  CRUDAddTimeOfDayIn(this.timeIn);
}

class CRUDAddTimeOfDayOut extends CRUDsignatureEvent {
  final TimeOfDay timeOut;

  CRUDAddTimeOfDayOut(this.timeOut);
}

class CRUDAddRoom extends CRUDsignatureEvent {
  final ClassroomModel classroom;

  CRUDAddRoom(this.classroom);
}

class CRUDAddColor extends CRUDsignatureEvent {
  final Color? color;

  CRUDAddColor(this.color);
}

class CRUDclean extends CRUDsignatureEvent {}

class CRUDAddItemScheduleModel extends CRUDsignatureEvent {
  final ItemScheduleModel itemScheduleModel;

  CRUDAddItemScheduleModel(this.itemScheduleModel);
}
