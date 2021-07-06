// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassroomModel _$ClassroomModelFromJson(Map<String, dynamic> json) {
  return ClassroomModel(
    name: json['name'] as String,
    description: json['description'] as String?,
    type: _$enumDecode(_$TypeDescriptionEnumMap, json['type']),
  );
}

Map<String, dynamic> _$ClassroomModelToJson(ClassroomModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'type': _$TypeDescriptionEnumMap[instance.type],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$TypeDescriptionEnumMap = {
  TypeDescription.text: 'text',
  TypeDescription.url: 'url',
};
