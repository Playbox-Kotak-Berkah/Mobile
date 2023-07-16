import 'package:json_annotation/json_annotation.dart';
import 'package:playbox/services/api/source/model_factory.dart';

part 'cycle_daily_model.g.dart';

@JsonSerializable()
class CycleDailyModel implements ModelFactory {
  int id;

  @JsonKey(name: "siklus_id")
  int cycleId;
  String tanggal;
  num ph_realtime;
  num ph_pagi;
  num ph_siang;
  num ph_malam;
  num suhu_realtime;
  num suhu_pagi;
  num suhu_siang;
  num suhu_malam;
  num do_realtime;
  num do_pagi;
  num do_siang;
  num do_malam;
  num garam_realtime;
  num garam_pagi;
  num garam_siang;
  num garam_malam;
  num doc;
  String CreatedAt;
  String UpdatedAt;

  CycleDailyModel({
    required this.CreatedAt,
    required this.UpdatedAt,
    required this.cycleId,
    required this.do_malam,
    required this.do_pagi,
    required this.do_realtime,
    required this.do_siang,
    required this.doc,
    required this.garam_malam,
    required this.garam_pagi,
    required this.garam_realtime,
    required this.garam_siang,
    required this.id,
    required this.ph_malam,
    required this.ph_pagi,
    required this.ph_realtime,
    required this.ph_siang,
    required this.suhu_malam,
    required this.suhu_pagi,
    required this.suhu_realtime,
    required this.suhu_siang,
    required this.tanggal,
  });

  factory CycleDailyModel.fromJson(Map<String, dynamic> json) =>
      _$CycleDailyModelFromJson(json);
  Map<String, dynamic> toJson() => _$CycleDailyModelToJson(this);
}
