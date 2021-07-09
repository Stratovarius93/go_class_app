import 'package:go_class_app/models/daySchedule/daySchedule_model.dart';
import 'package:sembast/sembast.dart';

import '../db.dart';

List<DayScheduleModel> scheduleListGeneral = [];

class ScheduleStore {
  ScheduleStore._internal();
  static ScheduleStore _instance = ScheduleStore._internal();
  static ScheduleStore get instance => _instance;
  Database _database = DB.instance.database;
  final StoreRef<String, Map> _storeRef = StoreRef<String, Map>('scheduleList');

  Future<List<DayScheduleModel>> find() async {
    List<RecordSnapshot<String, dynamic>> snapshots =
        await this._storeRef.find(this._database);
    return snapshots.map((RecordSnapshot<String, dynamic> snap) {
      return DayScheduleModel.fromJson(snap.value);
    }).toList();
  }

  Future<void> add(DayScheduleModel dayScheduleModel) async {
    await this
        ._storeRef
        .record(dayScheduleModel.id)
        .put(this._database, dayScheduleModel.toJson());
  }

  Future<int> delete() async {
    return await this._storeRef.delete(this._database);
  }

  Future<void> update(DayScheduleModel dayScheduleModel) async {
    await this
        ._storeRef
        .record(dayScheduleModel.id)
        .update(this._database, dayScheduleModel.toJson());
  }
}
