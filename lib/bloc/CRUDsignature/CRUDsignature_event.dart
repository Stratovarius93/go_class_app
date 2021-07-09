part of 'CRUDsignature_bloc.dart';

@immutable
abstract class CRUDsignatureEvent {}

class CRUDAddSignature extends CRUDsignatureEvent {
  final String signatureId;

  CRUDAddSignature(this.signatureId);
}

class CRUDAddTeacher extends CRUDsignatureEvent {
  final String teacherId;

  CRUDAddTeacher(this.teacherId);
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
  final String classroomId;

  CRUDAddRoom(this.classroomId);
}

class CRUDAddColor extends CRUDsignatureEvent {
  final int? color;

  CRUDAddColor(this.color);
}

class CRUDclean extends CRUDsignatureEvent {}

class CRUDAddItemScheduleModel extends CRUDsignatureEvent {
  final ItemScheduleModel itemScheduleModel;

  CRUDAddItemScheduleModel(this.itemScheduleModel);
}
