import 'package:go_class_app/models/room_model.dart';
import 'package:sembast/sembast.dart';

import '../db.dart';

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

class ClassroomStore {
  ClassroomStore._internal();
  static ClassroomStore _instance = ClassroomStore._internal();
  static ClassroomStore get instance => _instance;
  Database _database = DB.instance.database;
  final StoreRef<String, Map> _storeRef =
      StoreRef<String, Map>('classroomList');

  Future<List<ClassroomModel>> find() async {
    List<RecordSnapshot<String, dynamic>> snapshots =
        await this._storeRef.find(this._database);
    return snapshots.map((RecordSnapshot<String, dynamic> snap) {
      return ClassroomModel.fromJson(snap.value);
    }).toList();
  }

  Future<void> add(ClassroomModel classroomModel) async {
    await this
        ._storeRef
        .record(classroomModel.name)
        .put(this._database, classroomModel.toJson());
  }

  Future<int> delete() async {
    return await this._storeRef.delete(this._database);
  }

  Future<void> update(ClassroomModel classroomModel) async {
    await this
        ._storeRef
        .record(classroomModel.name)
        .update(this._database, classroomModel.toJson());
  }
}
