import 'package:go_class_app/models/itemSchedule/itemSchedule_model.dart';
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

  Map<String, dynamic> toJson() => _$DayScheduleModelToJson(this);

  factory DayScheduleModel.fromJson(Map<String, dynamic> data) =>
      _$DayScheduleModelFromJson(data);
}
