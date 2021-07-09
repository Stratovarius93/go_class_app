// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherModel _$TeacherModelFromJson(Map<String, dynamic> json) {
  return TeacherModel(
    id: json['id'] as String?,
    name: json['name'] as String,
    lastName: json['lastName'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
  );
}

Map<String, dynamic> _$TeacherModelToJson(TeacherModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
    };
