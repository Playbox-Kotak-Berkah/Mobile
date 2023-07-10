// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FarmModel _$FarmModelFromJson(Map<String, dynamic> json) => FarmModel(
      farmer:
          ProfileModel.fromJson(json['aqua_farmer'] as Map<String, dynamic>),
      farmerId: json['aqua_farmer_id'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$FarmModelToJson(FarmModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'aqua_farmer': instance.farmer,
      'aqua_farmer_id': instance.farmerId,
    };
