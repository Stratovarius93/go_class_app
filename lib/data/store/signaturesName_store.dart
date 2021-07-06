import 'package:go_class_app/models/signature_model.dart';
import 'package:sembast/sembast.dart';

import '../db.dart';

List<SignatureModel> signaturesNameList = [
  SignatureModel(name: 'Matemáticas'),
  SignatureModel(name: 'Inglés'),
  SignatureModel(name: 'Lenguaje'),
  SignatureModel(name: 'Física'),
  SignatureModel(name: 'Química')
];

class SignatureNameStore {
  SignatureNameStore._internal();
  static SignatureNameStore _instance = SignatureNameStore._internal();
  static SignatureNameStore get instance => _instance;
  Database _database = DB.instance.database;
  final StoreRef<String, Map> _storeRef =
      StoreRef<String, Map>('signaturesNameList');

  Future<List<SignatureModel>> find() async {
    List<RecordSnapshot<String, dynamic>> snapshots =
        await this._storeRef.find(this._database);
    return snapshots.map((RecordSnapshot<String, dynamic> snap) {
      return SignatureModel.fromJson(snap.value);
    }).toList();
  }

  Future<void> add(SignatureModel signatureModel) async {
    await this
        ._storeRef
        .record(signatureModel.name)
        .put(this._database, signatureModel.toJson());
  }

  Future<int> delete() async {
    return await this._storeRef.delete(this._database);
  }

  Future<void> update(SignatureModel signatureModel) async {
    await this
        ._storeRef
        .record(signatureModel.name)
        .update(this._database, signatureModel.toJson());
  }
}
