// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemSchedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemScheduleModel _$ItemScheduleModelFromJson(Map<String, dynamic> json) {
  return ItemScheduleModel(
    name: json['name'] == null
        ? null
        : SignatureModel.fromJson(json['name'] as Map<String, dynamic>),
    teacher: json['teacher'] == null
        ? null
        : TeacherModel.fromJson(json['teacher'] as Map<String, dynamic>),
    timeIn: ItemScheduleModel._timeOfDayfromJson(json['timeIn'] as String),
    timeOut: ItemScheduleModel._timeOfDayfromJson(json['timeOut'] as String),
    classroom: json['classroom'] == null
        ? null
        : ClassroomModel.fromJson(json['classroom'] as Map<String, dynamic>),
    color: json['color'] as int,
  );
}

Map<String, dynamic> _$ItemScheduleModelToJson(ItemScheduleModel instance) =>
    <String, dynamic>{
      'name': instance.name?.toJson(),
      'teacher': instance.teacher?.toJson(),
      'timeIn': ItemScheduleModel._timeOfDayToJson(instance.timeIn),
      'timeOut': ItemScheduleModel._timeOfDayToJson(instance.timeOut),
      'classroom': instance.classroom?.toJson(),
      'color': instance.color,
    };
