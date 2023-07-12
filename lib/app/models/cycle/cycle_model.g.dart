// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CycleModel _$CycleModelFromJson(Map<String, dynamic> json) => CycleModel(
      CreatedAt: json['CreatedAt'] as String,
      UpdatedAt: json['UpdatedAt'] as String,
      end_date: json['end_date'] as String,
      farm: FarmModel.fromJson(json['Tambak'] as Map<String, dynamic>),
      farmId: json['tambak_id'] as int,
      farmer: ProfileModel.fromJson(json['AquaFarmer'] as Map<String, dynamic>),
      farmerId: json['aqua_farmer_id'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      pond: PondModel.fromJson(json['Kolam'] as Map<String, dynamic>),
      pondId: json['kolam_id'] as int,
      start_date: json['start_date'] as String,
    );

Map<String, dynamic> _$CycleModelToJson(CycleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'AquaFarmer': instance.farmer,
      'aqua_farmer_id': instance.farmerId,
      'Tambak': instance.farm,
      'tambak_id': instance.farmId,
      'Kolam': instance.pond,
      'kolam_id': instance.pondId,
      'name': instance.name,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'CreatedAt': instance.CreatedAt,
      'UpdatedAt': instance.UpdatedAt,
    };
