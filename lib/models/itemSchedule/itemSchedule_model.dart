import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'itemSchedule_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ItemScheduleModel {
  String? idSignature;
  String? idTeacher;
  @JsonKey(fromJson: _timeOfDayfromJson, toJson: _timeOfDayToJson)
  TimeOfDay timeIn;
  @JsonKey(fromJson: _timeOfDayfromJson, toJson: _timeOfDayToJson)
  TimeOfDay timeOut;
  String? idClassroom;
  int color;

  ItemScheduleModel(
      {required this.idSignature,
      this.idTeacher,
      required this.timeIn,
      required this.timeOut,
      this.idClassroom,
      required this.color});

  Map<String, dynamic> toJson() => _$ItemScheduleModelToJson(this);

  factory ItemScheduleModel.fromJson(Map<String, dynamic> data) =>
      _$ItemScheduleModelFromJson(data);

  static TimeOfDay _timeOfDayfromJson(String json) => _stringToTimeOfDay(json);
  static String _timeOfDayToJson(TimeOfDay time) => _timeOfDayToString(time);
}

String _timeOfDayToString(TimeOfDay timeOfDay) {
  int num1 = timeOfDay.hour;
  int num2 = timeOfDay.minute;
  String time = '$num1:$num2';
  return time;
}

TimeOfDay _stringToTimeOfDay(String s) => TimeOfDay(
    hour: int.parse(s.split(":")[0]), minute: int.parse(s.split(":")[1]));
