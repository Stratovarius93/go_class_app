import 'package:go_class_app/models/itemSchedule_model.dart';

class DayScheduleModel {
  List<ItemScheduleModel> scheduleList;
  bool visible;
  String day;

  DayScheduleModel(
      {required this.scheduleList, required this.visible, required this.day});
}
