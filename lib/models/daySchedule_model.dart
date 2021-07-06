import 'package:go_class_app/models/itemSchedule_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'daySchedule_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DayScheduleModel {
  String id;
  List<ItemScheduleModel> scheduleList;
  bool visible;
  String day;

  DayScheduleModel(
      {required this.id,
      required this.scheduleList,
      required this.visible,
      required this.day});

  //Map<String, dynamic> toJson() {
  //return {
  //'id': this.id,
  //'scheduleList':
  //this.scheduleList.map((e) => e.toJson()).toList(growable: false),
  //'visible': this.visible,
  //'day': this.day
  //};
  //}

  Map<String, dynamic> toJson() => _$DayScheduleModelToJson(this);

  //static DayScheduleModel fromJson(Map<dynamic, dynamic> json) {
  //return DayScheduleModel(
  //id: json['id'],
  //scheduleList: json['scheduleList'],
  //visible: json['visible'],
  //day: json['day']);
  //}

  factory DayScheduleModel.fromJson(Map<String, dynamic> data) =>
      _$DayScheduleModelFromJson(data);
}
