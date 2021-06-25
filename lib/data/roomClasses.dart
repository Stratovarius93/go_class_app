import 'package:go_class_app/models/room_model.dart';

List<ClassroomModel> classroomList = [
  ClassroomModel(
      name: 'Sala 1',
      description: 'https://unibe.zoom.us/j/93446477711',
      type: TypeDescription.url),
  ClassroomModel(
      name: 'Sala 2',
      description: 'https://www.zoom.us',
      type: TypeDescription.url),
  ClassroomModel(
      name: 'Sala 3', description: 'Presencial', type: TypeDescription.text),
  ClassroomModel(
      name: 'Sala 4',
      description: 'https://www.zoom.us',
      type: TypeDescription.url),
  ClassroomModel(
      name: 'Sala 5', description: 'Presencial', type: TypeDescription.text),
  ClassroomModel(
      name: 'Sala 6',
      description: 'https://www.zoom.us',
      type: TypeDescription.url),
];
