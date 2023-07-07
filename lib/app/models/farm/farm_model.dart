import 'package:json_annotation/json_annotation.dart';
import 'package:playbox/app/models/profile/profile_model.dart';
import 'package:playbox/services/api/source/model_factory.dart';

part 'farm_model.g.dart';

@JsonSerializable()
class FarmModel implements ModelFactory {
  num id;
  String name;

  @JsonKey(name: "aqua_farmer")
  ProfileModel farmer;

  @JsonKey(name: "aqua_farmer_id")
  String farmerId;

  FarmModel({
    required this.farmer,
    required this.farmerId,
    required this.id,
    required this.name,
  });

  factory FarmModel.fromJson(Map<String, dynamic> json) =>
      _$FarmModelFromJson(json);
  Map<String, dynamic> toJson() => _$FarmModelToJson(this);
}
