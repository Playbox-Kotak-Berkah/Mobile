// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_daily_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CycleDailyModel _$CycleDailyModelFromJson(Map<String, dynamic> json) =>
    CycleDailyModel(
      CreatedAt: json['CreatedAt'] as String,
      UpdatedAt: json['UpdatedAt'] as String,
      cycleId: json['siklus_id'] as int,
      do_malam: json['do_malam'] as num,
      do_pagi: json['do_pagi'] as num,
      do_realtime: json['do_realtime'] as num,
      do_siang: json['do_siang'] as num,
      doc: json['doc'] as num,
      garam_malam: json['garam_malam'] as num,
      garam_pagi: json['garam_pagi'] as num,
      garam_realtime: json['garam_realtime'] as num,
      garam_siang: json['garam_siang'] as num,
      id: json['id'] as int,
      ph_malam: json['ph_malam'] as num,
      ph_pagi: json['ph_pagi'] as num,
      ph_realtime: json['ph_realtime'] as num,
      ph_siang: json['ph_siang'] as num,
      suhu_malam: json['suhu_malam'] as num,
      suhu_pagi: json['suhu_pagi'] as num,
      suhu_realtime: json['suhu_realtime'] as num,
      suhu_siang: json['suhu_siang'] as num,
      tanggal: json['tanggal'] as String,
    );

Map<String, dynamic> _$CycleDailyModelToJson(CycleDailyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'siklus_id': instance.cycleId,
      'tanggal': instance.tanggal,
      'ph_realtime': instance.ph_realtime,
      'ph_pagi': instance.ph_pagi,
      'ph_siang': instance.ph_siang,
      'ph_malam': instance.ph_malam,
      'suhu_realtime': instance.suhu_realtime,
      'suhu_pagi': instance.suhu_pagi,
      'suhu_siang': instance.suhu_siang,
      'suhu_malam': instance.suhu_malam,
      'do_realtime': instance.do_realtime,
      'do_pagi': instance.do_pagi,
      'do_siang': instance.do_siang,
      'do_malam': instance.do_malam,
      'garam_realtime': instance.garam_realtime,
      'garam_pagi': instance.garam_pagi,
      'garam_siang': instance.garam_siang,
      'garam_malam': instance.garam_malam,
      'doc': instance.doc,
      'CreatedAt': instance.CreatedAt,
      'UpdatedAt': instance.UpdatedAt,
    };
