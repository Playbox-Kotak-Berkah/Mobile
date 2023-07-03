import 'package:json_annotation/json_annotation.dart';
import 'package:playbox/services/api/source/model_factory.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel implements ModelFactory {
  String token;
  String name;
  String type;

  LoginModel({required this.token, required this.name, required this.type});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
