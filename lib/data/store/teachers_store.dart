import 'package:go_class_app/models/teacher_model.dart';
import 'package:sembast/sembast.dart';

import '../db.dart';

List<TeacherModel> teachersList = [
  TeacherModel(name: 'Juan', lastName: 'Perez', phoneNumber: '123456789'),
  TeacherModel(name: 'Luis', lastName: 'Andrade', phoneNumber: '123456789'),
  TeacherModel(name: 'Alberto', lastName: 'Perez', phoneNumber: '123456789'),
  TeacherModel(name: 'Ana', lastName: 'Mena', phoneNumber: '123456789'),
  TeacherModel(
      name: 'Daniela', lastName: 'Rodriguez', phoneNumber: '123456789'),
  TeacherModel(name: 'John', lastName: 'Doe', phoneNumber: '123456789'),
];

class TeacherStore {
  TeacherStore._internal();
  static TeacherStore _instance = TeacherStore._internal();
  static TeacherStore get instance => _instance;
  Database _database = DB.instance.database;
  final StoreRef<String, Map> _storeRef =
      StoreRef<String, Map>('classroomList');

  Future<List<TeacherModel>> find() async {
    List<RecordSnapshot<String, dynamic>> snapshots =
        await this._storeRef.find(this._database);
    return snapshots.map((RecordSnapshot<String, dynamic> snap) {
      return TeacherModel.fromJson(snap.value);
    }).toList();
  }

  Future<void> add(TeacherModel teacherModel) async {
    await this
        ._storeRef
        .record(teacherModel.phoneNumber.toString())
        .put(this._database, teacherModel.toJson());
  }

  Future<int> delete() async {
    return await this._storeRef.delete(this._database);
  }

  Future<void> update(TeacherModel teacherModel) async {
    await this
        ._storeRef
        .record(teacherModel.phoneNumber.toString())
        .update(this._database, teacherModel.toJson());
  }
}
