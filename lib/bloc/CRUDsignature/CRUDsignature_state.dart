part of 'CRUDsignature_bloc.dart';

class CRUDsignatureState {
  final SignatureModel? signatureName;
  final TeacherModel? teacher;
  final TimeOfDay timeIn;
  final TimeOfDay timeOut;
  final ClassroomModel? classroom;
  final Color? color;

  CRUDsignatureState(
      {this.signatureName,
      this.teacher,
      this.timeIn = const TimeOfDay(hour: 0, minute: 0),
      this.timeOut = const TimeOfDay(hour: 0, minute: 0),
      this.classroom,
      this.color = AppColorLight.second});
}
