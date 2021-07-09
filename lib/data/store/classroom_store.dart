import 'package:go_class_app/models/classroom/room_model.dart';
import 'package:sembast/sembast.dart';

import '../db.dart';

class ClassroomStore {
  ClassroomStore._internal();
  static ClassroomStore _instance = ClassroomStore._internal();
  static ClassroomStore get instance => _instance;
  Database _database = DB.instance.database;
  final StoreRef<String, Map> _storeRef =
      StoreRef<String, Map>('classroomList');

  Future<List<ClassroomModel>> find({Finder? finder}) async {
    List<RecordSnapshot<String, dynamic>> snapshots =
        await this._storeRef.find(this._database, finder: finder);
    return snapshots.map((RecordSnapshot<String, dynamic> snap) {
      return ClassroomModel.fromJson(snap.value);
    }).toList();
  }

  Future<void> add(ClassroomModel classroomModel) async {
    await this
        ._storeRef
        .record(classroomModel.id!)
        .put(this._database, classroomModel.toJson());
  }

  Future<int> delete(Finder? finder) async {
    return await this._storeRef.delete(this._database, finder: finder);
  }

  Future<void> update(ClassroomModel classroomModel, Finder? finder) async {
    await this
        ._storeRef
        //.record(classroomModel.name)
        .update(this._database, classroomModel.toJson(), finder: finder);
  }
}
