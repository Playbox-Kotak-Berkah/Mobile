import 'package:json_annotation/json_annotation.dart';
import 'package:playbox/app/models/profile/profile_model.dart';

import 'package:playbox/services/api/source/model_factory.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel implements ModelFactory {
  @JsonKey(name: "AquaFarmer")
  ProfileModel farmer;

  @JsonKey(name: "aqua_farmer_id")
  String farmerId;

  int id;
  String name;
  String photo;
  num price;
  int sold;
  num rating;
  String created_at;
  String updated_at;

  ProductModel({
    required this.created_at,
    required this.farmer,
    required this.farmerId,
    required this.id,
    required this.name,
    required this.photo,
    required this.price,
    required this.rating,
    required this.sold,
    required this.updated_at,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
