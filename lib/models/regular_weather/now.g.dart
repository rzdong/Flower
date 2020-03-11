// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Now _$NowFromJson(Map<String, dynamic> json) {
  return Now()
    ..cloud = json['cloud'] as String
    ..cond_code = json['cond_code'] as String
    ..cond_txt = json['cond_txt'] as String
    ..fl = json['fl'] as String
    ..hum = json['hum'] as String
    ..pcpn = json['pcpn'] as String
    ..pres = json['pres'] as String
    ..tmp = json['tmp'] as String
    ..vis = json['vis'] as String
    ..wind_deg = json['wind_deg'] as String
    ..wind_dir = json['wind_dir'] as String
    ..wind_sc = json['wind_sc'] as String
    ..wind_spd = json['wind_spd'] as String;
}

Map<String, dynamic> _$NowToJson(Now instance) => <String, dynamic>{
      'cloud': instance.cloud,
      'cond_code': instance.cond_code,
      'cond_txt': instance.cond_txt,
      'fl': instance.fl,
      'hum': instance.hum,
      'pcpn': instance.pcpn,
      'pres': instance.pres,
      'tmp': instance.tmp,
      'vis': instance.vis,
      'wind_deg': instance.wind_deg,
      'wind_dir': instance.wind_dir,
      'wind_sc': instance.wind_sc,
      'wind_spd': instance.wind_spd
    };
