part of 'CRUDsignature_bloc.dart';

class CRUDsignatureState {
  final String? signatureId;
  final String? teacherId;
  final TimeOfDay timeIn;
  final TimeOfDay timeOut;
  final String? classroomId;
  final int? color;

  CRUDsignatureState(
      {this.signatureId,
      this.teacherId,
      this.timeIn = const TimeOfDay(hour: 0, minute: 0),
      this.timeOut = const TimeOfDay(hour: 0, minute: 0),
      this.classroomId,
      this.color = 1});
}
