import 'package:json_annotation/json_annotation.dart';
import 'package:playbox/services/api/source/model_factory.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel implements ModelFactory {
  String name;
  String email;
  String phone;
  String password;
  String confirm_password;

  RegisterModel({
    required this.confirm_password,
    required this.email,
    required this.name,
    required this.password,
    required this.phone,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
