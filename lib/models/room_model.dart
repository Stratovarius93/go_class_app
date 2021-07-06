import 'package:json_annotation/json_annotation.dart';

part 'room_model.g.dart';

@JsonSerializable()
class ClassroomModel {
  String name;
  String? description;
  TypeDescription type;

  ClassroomModel(
      {required this.name, required this.description, required this.type});

  Map<String, dynamic> toJson() => _$ClassroomModelToJson(this);

  factory ClassroomModel.fromJson(Map<String, dynamic> data) =>
      _$ClassroomModelFromJson(data);
}

enum TypeDescription {
  @JsonValue('text')
  text,
  @JsonValue('url')
  url
}
