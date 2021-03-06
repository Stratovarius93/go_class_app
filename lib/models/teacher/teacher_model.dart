import 'package:json_annotation/json_annotation.dart';
part 'teacher_model.g.dart';

@JsonSerializable()
class TeacherModel {
  String? id;
  String name;
  String? lastName;
  String? phoneNumber;

  TeacherModel({this.id, required this.name, this.lastName, this.phoneNumber});

  Map<String, dynamic> toJson() => _$TeacherModelToJson(this);

  factory TeacherModel.fromJson(Map<String, dynamic> data) =>
      _$TeacherModelFromJson(data);
}
