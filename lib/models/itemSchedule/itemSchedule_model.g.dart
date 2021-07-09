// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemSchedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemScheduleModel _$ItemScheduleModelFromJson(Map<String, dynamic> json) {
  return ItemScheduleModel(
    idSignature: json['idSignature'] as String?,
    idTeacher: json['idTeacher'] as String?,
    timeIn: ItemScheduleModel._timeOfDayfromJson(json['timeIn'] as String),
    timeOut: ItemScheduleModel._timeOfDayfromJson(json['timeOut'] as String),
    idClassroom: json['idClassroom'] as String?,
    color: json['color'] as int,
  );
}

Map<String, dynamic> _$ItemScheduleModelToJson(ItemScheduleModel instance) =>
    <String, dynamic>{
      'idSignature': instance.idSignature,
      'idTeacher': instance.idTeacher,
      'timeIn': ItemScheduleModel._timeOfDayToJson(instance.timeIn),
      'timeOut': ItemScheduleModel._timeOfDayToJson(instance.timeOut),
      'idClassroom': instance.idClassroom,
      'color': instance.color,
    };
