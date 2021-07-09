// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayModel _$DayModelFromJson(Map<String, dynamic> json) {
  return DayModel(
    id: json['id'] as String,
    name: json['name'] as String,
    enable: json['enable'] as bool,
    visible: json['visible'] as bool,
  );
}

Map<String, dynamic> _$DayModelToJson(DayModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'enable': instance.enable,
      'visible': instance.visible,
    };
