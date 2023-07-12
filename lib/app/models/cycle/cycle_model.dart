import 'package:json_annotation/json_annotation.dart';
import 'package:playbox/app/models/farm/farm_model.dart';
import 'package:playbox/app/models/pond/pond_model.dart';
import 'package:playbox/app/models/profile/profile_model.dart';
import 'package:playbox/services/api/source/model_factory.dart';

part 'cycle_model.g.dart';

@JsonSerializable()
class CycleModel implements ModelFactory {
  int id;

  @JsonKey(name: "AquaFarmer")
  ProfileModel farmer;

  @JsonKey(name: "aqua_farmer_id")
  String farmerId;

  @JsonKey(name: "Tambak")
  FarmModel farm;

  @JsonKey(name: "tambak_id")
  int farmId;

  @JsonKey(name: "Kolam")
  PondModel pond;

  @JsonKey(name: "kolam_id")
  int pondId;

  String name;
  String start_date;
  String end_date;
  String CreatedAt;
  String UpdatedAt;

  CycleModel({
    required this.CreatedAt,
    required this.UpdatedAt,
    required this.end_date,
    required this.farm,
    required this.farmId,
    required this.farmer,
    required this.farmerId,
    required this.id,
    required this.name,
    required this.pond,
    required this.pondId,
    required this.start_date,
  });

  factory CycleModel.fromJson(Map<String, dynamic> json) =>
      _$CycleModelFromJson(json);
  Map<String, dynamic> toJson() => _$CycleModelToJson(this);
}
