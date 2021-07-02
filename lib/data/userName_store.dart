import 'package:go_class_app/data/db.dart';
import 'package:sembast/sembast.dart';

class UsernameStore {
  UsernameStore._internal();
  static UsernameStore _instance = UsernameStore._internal();
  static UsernameStore get instance => _instance;
  Database _database = DB.instance.database;
  final StoreRef _storeRef = StoreRef('username');
  String _username = '';

  String get username => _username;

  Future<void> add(String name) async {
    this._username = name;
    await this
        ._storeRef
        .record('USER_NAME')
        .put(this._database, this._username);
  }

  Future<void> init() async {
    this._username =
        (await this._storeRef.record('USER_NAME').get(this._database)) ??
            'No Name';
  }
}
