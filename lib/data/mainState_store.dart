import 'package:go_class_app/data/db.dart';
import 'package:sembast/sembast.dart';

class MainStateStore {
  MainStateStore._internal();
  static MainStateStore _instance = MainStateStore._internal();
  static MainStateStore get instance => _instance;

  final StoreRef _storeRef = StoreRef.main();
  final Database _db = DB.instance.database;

  bool _mainState = false;
  bool get mainState => _mainState;

  change(bool mainEnable) async {
    this._mainState = mainEnable;
    await this._storeRef.record('MAIN_ENABLED').put(this._db, this._mainState);
  }

  Future<void> init() async {
    this._mainState =
        (await this._storeRef.record('MAIN_ENABLED').get(_db)) ?? false;
  }
}
