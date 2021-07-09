import 'package:go_class_app/models/signature/signature_model.dart';
import 'package:sembast/sembast.dart';

import '../db.dart';

class SignatureNameStore {
  SignatureNameStore._internal();
  static SignatureNameStore _instance = SignatureNameStore._internal();
  static SignatureNameStore get instance => _instance;
  Database _database = DB.instance.database;
  final StoreRef<String, Map> _storeRef =
      StoreRef<String, Map>('signaturesNameList');

  Future<List<SignatureModel>> find({Finder? finder}) async {
    List<RecordSnapshot<String, dynamic>> snapshots =
        await this._storeRef.find(this._database, finder: finder);
    return snapshots.map((RecordSnapshot<String, dynamic> snap) {
      return SignatureModel.fromJson(snap.value);
    }).toList();
  }

  Future<void> add(SignatureModel signatureModel) async {
    await this
        ._storeRef
        .record(signatureModel.id!)
        .put(this._database, signatureModel.toJson());
  }

  Future<int> delete(Finder finder) async {
    return await this._storeRef.delete(this._database, finder: finder);
  }

  Future<void> update(SignatureModel signatureModel, Finder finder) async {
    await this
        ._storeRef
        //.record(signatureModel.name)
        .update(this._database, signatureModel.toJson(), finder: finder);
  }
}
