import 'package:flutter/material.dart';
import 'package:go_class_app/models/room_model.dart';
import 'package:go_class_app/models/signature_model.dart';
import 'package:go_class_app/models/teacher_model.dart';

class ItemScheduleModel {
  SignatureModel? name;
  TeacherModel? teacher;
  TimeOfDay timeIn;
  TimeOfDay timeOut;
  ClassroomModel? classroom;
  Color? color;

  ItemScheduleModel(
      {required this.name,
      this.teacher,
      required this.timeIn,
      required this.timeOut,
      this.classroom,
      this.color});
}
