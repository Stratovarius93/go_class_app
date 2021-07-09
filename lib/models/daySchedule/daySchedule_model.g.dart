// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daySchedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayScheduleModel _$DayScheduleModelFromJson(Map<String, dynamic> json) {
  return DayScheduleModel(
    id: json['id'] as String,
    scheduleList: (json['scheduleList'] as List<dynamic>)
        .map((e) => ItemScheduleModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    visible: json['visible'] as bool,
    day: json['day'] as String,
  );
}

Map<String, dynamic> _$DayScheduleModelToJson(DayScheduleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scheduleList': instance.scheduleList.map((e) => e.toJson()).toList(),
      'visible': instance.visible,
      'day': instance.day,
    };
