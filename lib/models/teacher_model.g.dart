// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherModel _$TeacherModelFromJson(Map<String, dynamic> json) {
  return TeacherModel(
    name: json['name'] as String,
    lastName: json['lastName'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
  );
}

Map<String, dynamic> _$TeacherModelToJson(TeacherModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
    };
