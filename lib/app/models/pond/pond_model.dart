import 'package:json_annotation/json_annotation.dart';
import 'package:playbox/app/models/farm/farm_model.dart';
import 'package:playbox/app/models/profile/profile_model.dart';
import 'package:playbox/services/api/source/model_factory.dart';

part 'pond_model.g.dart';

@JsonSerializable()
class PondModel implements ModelFactory {
  int id;
  String name;

  @JsonKey(name: "lampu_tambak_status")
  bool statusBulb;

  @JsonKey(name: "kincir_air_status")
  bool statusFan;

  @JsonKey(name: "keran_air_status")
  bool statusWater;

  @JsonKey(name: "AquaFarmer")
  ProfileModel farmer;

  @JsonKey(name: "aqua_farmer_id")
  String farmerId;

  @JsonKey(name: "Tambak")
  FarmModel farm;

  @JsonKey(name: "tambak_id")
  int farmId;

  String CreatedAt;
  String UpdatedAt;

  PondModel({
    required this.id,
    required this.name,
    required this.statusBulb,
    required this.statusFan,
    required this.statusWater,
    required this.farmer,
    required this.farmerId,
    required this.CreatedAt,
    required this.UpdatedAt,
    required this.farm,
    required this.farmId,
  });

  factory PondModel.fromJson(Map<String, dynamic> json) =>
      _$PondModelFromJson(json);
  Map<String, dynamic> toJson() => _$PondModelToJson(this);
}
