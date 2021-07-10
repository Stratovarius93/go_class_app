import 'package:json_annotation/json_annotation.dart';

part 'day_model.g.dart';

@JsonSerializable()
class DayModel {
  String id;
  int name;
  bool enable;
  bool visible;

  DayModel(
      {required this.id,
      required this.name,
      required this.enable,
      required this.visible});

  @override
  String toString() {
    return '[$visible]\r\n';
  }

  Map<String, dynamic> toJson() => _$DayModelToJson(this);

  factory DayModel.fromJson(Map<String, dynamic> data) =>
      _$DayModelFromJson(data);
}
