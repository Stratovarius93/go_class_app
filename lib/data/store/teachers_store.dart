import 'package:go_class_app/models/teacher/teacher_model.dart';
import 'package:sembast/sembast.dart';

import '../db.dart';

class TeacherStore {
  TeacherStore._internal();
  static TeacherStore _instance = TeacherStore._internal();
  static TeacherStore get instance => _instance;
  Database _database = DB.instance.database;
  final StoreRef<String, Map> _storeRef = StoreRef<String, Map>('teachersList');

  Future<List<TeacherModel>> find({Finder? finder}) async {
    List<RecordSnapshot<String, dynamic>> snapshots =
        await this._storeRef.find(this._database, finder: finder);
    return snapshots.map((RecordSnapshot<String, dynamic> snap) {
      return TeacherModel.fromJson(snap.value);
    }).toList();
  }

  Future<void> add(TeacherModel teacherModel) async {
    await this
        ._storeRef
        .record(teacherModel.id!)
        .put(this._database, teacherModel.toJson());
  }

  Future<int> delete(Finder finder) async {
    return await this._storeRef.delete(this._database, finder: finder);
  }

  Future<void> update(TeacherModel teacherModel, Finder finder) async {
    await this
        ._storeRef
        //.record(teacherModel.phoneNumber.toString())
        .update(this._database, teacherModel.toJson(), finder: finder);
  }
}
