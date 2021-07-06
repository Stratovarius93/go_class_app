import 'package:json_annotation/json_annotation.dart';

part 'signature_model.g.dart';

@JsonSerializable()
class SignatureModel {
  String name;

  SignatureModel({
    required this.name,
  });

  Map<String, dynamic> toJson() => _$SignatureModelToJson(this);

  factory SignatureModel.fromJson(Map<String, dynamic> data) =>
      _$SignatureModelFromJson(data);
}
