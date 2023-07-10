// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pond_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PondModel _$PondModelFromJson(Map<String, dynamic> json) => PondModel(
      id: json['id'] as int,
      name: json['name'] as String,
      statusBulb: json['lampu_tambak_status'] as bool,
      statusFan: json['kincir_air_status'] as bool,
      statusWater: json['keran_air_status'] as bool,
      farmer: ProfileModel.fromJson(json['AquaFarmer'] as Map<String, dynamic>),
      farmerId: json['aqua_farmer_id'] as String,
      CreatedAt: json['CreatedAt'] as String,
      UpdatedAt: json['UpdatedAt'] as String,
      farm: FarmModel.fromJson(json['Tambak'] as Map<String, dynamic>),
      farmId: json['tambak_id'] as int,
    );

Map<String, dynamic> _$PondModelToJson(PondModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lampu_tambak_status': instance.statusBulb,
      'kincir_air_status': instance.statusFan,
      'keran_air_status': instance.statusWater,
      'AquaFarmer': instance.farmer,
      'aqua_farmer_id': instance.farmerId,
      'Tambak': instance.farm,
      'tambak_id': instance.farmId,
      'CreatedAt': instance.CreatedAt,
      'UpdatedAt': instance.UpdatedAt,
    };
