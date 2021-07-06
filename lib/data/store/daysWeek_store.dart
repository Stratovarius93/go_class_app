import 'package:go_class_app/data/db.dart';
import 'package:go_class_app/models/day_model.dart';
import 'package:sembast/sembast.dart';

List<DayModel> weekList = [];

class WeekDaysStore {
  WeekDaysStore._internal();
  static WeekDaysStore _instance = WeekDaysStore._internal();
  static WeekDaysStore get instance => _instance;
  Database _database = DB.instance.database;
  final StoreRef<String, Map> _storeRef = StoreRef<String, Map>('weekDays');

  Future<List<DayModel>> find() async {
    List<RecordSnapshot<String, dynamic>> snapshots =
        await this._storeRef.find(this._database);
    return snapshots.map((RecordSnapshot<String, dynamic> snap) {
      return DayModel.fromJson(snap.value);
    }).toList();
  }

  Future<void> add(DayModel daymodel) async {
    await this
        ._storeRef
        .record(daymodel.id)
        .put(this._database, daymodel.toJson());
  }

  Future<int> delete() async {
    return await this._storeRef.delete(this._database);
  }

  Future<void> update(DayModel dayModel) async {
    await this
        ._storeRef
        .record(dayModel.id)
        .update(this._database, dayModel.toJson());
  }
}
