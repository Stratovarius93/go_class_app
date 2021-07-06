import 'package:flutter/material.dart';
import 'package:go_class_app/models/room_model.dart';
import 'package:go_class_app/models/signature_model.dart';
import 'package:go_class_app/models/teacher_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'itemSchedule_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ItemScheduleModel {
  SignatureModel? name;
  TeacherModel? teacher;
  @JsonKey(fromJson: _timeOfDayfromJson, toJson: _timeOfDayToJson)
  TimeOfDay timeIn;
  @JsonKey(fromJson: _timeOfDayfromJson, toJson: _timeOfDayToJson)
  TimeOfDay timeOut;
  ClassroomModel? classroom;
  int color;

  ItemScheduleModel(
      {required this.name,
      this.teacher,
      required this.timeIn,
      required this.timeOut,
      this.classroom,
      required this.color});

  Map<String, dynamic> toJson() => _$ItemScheduleModelToJson(this);

  factory ItemScheduleModel.fromJson(Map<String, dynamic> data) =>
      _$ItemScheduleModelFromJson(data);

  static TimeOfDay _timeOfDayfromJson(String json) => _stringToTimeOfDay(json);
  static String _timeOfDayToJson(TimeOfDay time) => _timeOfDayToString(time);
}

String _timeOfDayToString(TimeOfDay timeOfDay) {
  //final now = new DateTime.now();
  //final dt =
  //DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  //final format = DateFormat.jm(); //"6:00 AM"
  //return format.format(dt);
  int num1 = timeOfDay.hour;
  int num2 = timeOfDay.minute;
  String time = '$num1:$num2';
  return time;
}

TimeOfDay _stringToTimeOfDay(String s) => TimeOfDay(
    hour: int.parse(s.split(":")[0]), minute: int.parse(s.split(":")[1]));
