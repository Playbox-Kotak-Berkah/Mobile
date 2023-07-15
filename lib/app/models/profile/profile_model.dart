import 'package:json_annotation/json_annotation.dart';
import 'package:playbox/services/api/source/model_factory.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel implements ModelFactory {
  String id;
  String name;
  String phone;
  String email;
  String password;
  String CreatedAt;
  String UpdatedAt;
  String picture;

  ProfileModel({
    required this.CreatedAt,
    required this.UpdatedAt,
    required this.email,
    required this.id,
    required this.name,
    required this.password,
    required this.phone,
    required this.picture,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
