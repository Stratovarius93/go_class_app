import 'package:flutter/material.dart';
import 'package:go_class_app/data/roomClasses.dart';
import 'package:go_class_app/data/teachers.dart';
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

List<List<ItemScheduleModel>> scheduleListGeneral = [
  scheduleList0,
  scheduleList1,
  scheduleList2,
  scheduleList3,
  scheduleList4,
  scheduleList5,
  scheduleList6
];
