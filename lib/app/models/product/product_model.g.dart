// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      created_at: json['created_at'] as String,
      farmer: ProfileModel.fromJson(json['AquaFarmer'] as Map<String, dynamic>),
      farmerId: json['aqua_farmer_id'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      photo: json['photo'] as String,
      price: json['price'] as num,
      rating: json['rating'] as num,
      sold: json['sold'] as int,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'AquaFarmer': instance.farmer,
      'aqua_farmer_id': instance.farmerId,
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'price': instance.price,
      'sold': instance.sold,
      'rating': instance.rating,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
