import 'package:flutter/material.dart';
import 'package:go_class_app/data/daysWeek_data.dart';
import 'package:go_class_app/data/roomClasses.dart';
import 'package:go_class_app/data/teachers.dart';
import 'package:go_class_app/models/daySchedule_model.dart';
import 'package:go_class_app/models/itemSchedule_model.dart';
import 'package:go_class_app/models/signature_model.dart';
import 'package:go_class_app/widgets/constants/colors.dart';

List<ItemScheduleModel> scheduleList0 = [
  ItemScheduleModel(
      name: SignatureModel(name: 'Lenguaje y Comunicacion'),
      timeIn: TimeOfDay(hour: 07, minute: 00),
      timeOut: TimeOfDay(hour: 09, minute: 00),
      teacher: teachersList[1],
      classroom: classroomList[0],
      color: AppColorLight.listSchedule[0]),
  ItemScheduleModel(
      name: SignatureModel(name: 'Frances'),
      timeIn: TimeOfDay(hour: 09, minute: 00),
      timeOut: TimeOfDay(hour: 11, minute: 00),
      teacher: teachersList[1],
      classroom: classroomList[2],
      color: AppColorLight.listSchedule[1]),
  ItemScheduleModel(
      name: SignatureModel(name: 'Frances'),
      timeIn: TimeOfDay(hour: 11, minute: 00),
      timeOut: TimeOfDay(hour: 13, minute: 00),
      teacher: teachersList[1],
      classroom: classroomList[2],
      color: AppColorLight.listSchedule[1])
];

List<ItemScheduleModel> scheduleList1 = [
  ItemScheduleModel(
      name: SignatureModel(name: 'Aleman'),
      timeIn: TimeOfDay(hour: 07, minute: 00),
      timeOut: TimeOfDay(hour: 09, minute: 00),
      teacher: teachersList[1],
      classroom: classroomList[0],
      color: AppColorLight.listSchedule[0]),
];

List<ItemScheduleModel> scheduleList2 = [
  ItemScheduleModel(
      name: SignatureModel(name: 'Frances'),
      timeIn: TimeOfDay(hour: 09, minute: 00),
      timeOut: TimeOfDay(hour: 11, minute: 00),
      teacher: teachersList[1],
      classroom: classroomList[0],
      color: AppColorLight.listSchedule[1])
];

List<ItemScheduleModel> scheduleList3 = [
  ItemScheduleModel(
      name: SignatureModel(name: 'Frances'),
      timeIn: TimeOfDay(hour: 09, minute: 00),
      timeOut: TimeOfDay(hour: 11, minute: 00),
      teacher: teachersList[1],
      classroom: classroomList[0],
      color: AppColorLight.listSchedule[1]),
];

List<ItemScheduleModel> scheduleList4 = [
  ItemScheduleModel(
      name: SignatureModel(name: 'Aleman'),
      timeIn: TimeOfDay(hour: 07, minute: 00),
      timeOut: TimeOfDay(hour: 09, minute: 00),
      teacher: teachersList[1],
      classroom: classroomList[0],
      color: AppColorLight.listSchedule[0]),
  ItemScheduleModel(
      name: SignatureModel(name: 'Frances'),
      timeIn: TimeOfDay(hour: 09, minute: 00),
      timeOut: TimeOfDay(hour: 11, minute: 00),
      teacher: teachersList[1],
      classroom: classroomList[0],
      color: AppColorLight.listSchedule[1]),
  ItemScheduleModel(
      name: SignatureModel(name: 'Frances'),
      timeIn: TimeOfDay(hour: 11, minute: 00),
      timeOut: TimeOfDay(hour: 13, minute: 00),
      teacher: teachersList[1],
      classroom: classroomList[0],
      color: AppColorLight.listSchedule[1])
];

List<ItemScheduleModel> scheduleList5 = [
  ItemScheduleModel(
      name: SignatureModel(name: 'Aleman'),
      timeIn: TimeOfDay(hour: 07, minute: 00),
      timeOut: TimeOfDay(hour: 09, minute: 00),
      teacher: teachersList[1],
      classroom: classroomList[0],
      color: AppColorLight.listSchedule[0]),
];

List<ItemScheduleModel> scheduleList6 = [
  ItemScheduleModel(
      name: SignatureModel(name: 'Aleman'),
      timeIn: TimeOfDay(hour: 07, minute: 00),
      timeOut: TimeOfDay(hour: 09, minute: 00),
      teacher: teachersList[1],
      classroom: classroomList[0],
      color: AppColorLight.listSchedule[0]),
  ItemScheduleModel(
      name: SignatureModel(name: 'Frances'),
      timeIn: TimeOfDay(hour: 09, minute: 00),
      timeOut: TimeOfDay(hour: 11, minute: 00),
      teacher: teachersList[1],
      classroom: classroomList[0],
      color: AppColorLight.listSchedule[1]),
  ItemScheduleModel(
      name: SignatureModel(name: 'Frances'),
      timeIn: TimeOfDay(hour: 11, minute: 00),
      timeOut: TimeOfDay(hour: 13, minute: 00),
      teacher: teachersList[1],
      classroom: classroomList[0],
      color: AppColorLight.listSchedule[1])
];

List<DayScheduleModel> scheduleListGeneral = [
  DayScheduleModel(
      scheduleList: scheduleList0, visible: true, day: weekList[0].name),
  DayScheduleModel(
      scheduleList: scheduleList1, visible: true, day: weekList[1].name),
  DayScheduleModel(
      scheduleList: scheduleList2, visible: true, day: weekList[2].name),
  DayScheduleModel(
      scheduleList: scheduleList3, visible: false, day: weekList[3].name),
  DayScheduleModel(
      scheduleList: scheduleList4, visible: true, day: weekList[4].name),
  DayScheduleModel(
      scheduleList: scheduleList5, visible: false, day: weekList[5].name),
  DayScheduleModel(
      scheduleList: scheduleList6, visible: false, day: weekList[6].name),
];
