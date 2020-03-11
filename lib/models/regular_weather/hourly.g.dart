// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hourly _$HourlyFromJson(Map<String, dynamic> json) {
  return Hourly()
    ..cloud = json['cloud'] as String
    ..cond_code = json['cond_code'] as String
    ..cond_txt = json['cond_txt'] as String
    ..dew = json['dew'] as String
    ..hum = json['hum'] as String
    ..pop = json['pop'] as String
    ..pres = json['pres'] as String
    ..time = json['time'] as String
    ..tmp = json['tmp'] as String
    ..wind_deg = json['wind_deg'] as String
    ..wind_dir = json['wind_dir'] as String
    ..wind_sc = json['wind_sc'] as String
    ..wind_spd = json['wind_spd'] as String;
}

Map<String, dynamic> _$HourlyToJson(Hourly instance) => <String, dynamic>{
      'cloud': instance.cloud,
      'cond_code': instance.cond_code,
      'cond_txt': instance.cond_txt,
      'dew': instance.dew,
      'hum': instance.hum,
      'pop': instance.pop,
      'pres': instance.pres,
      'time': instance.time,
      'tmp': instance.tmp,
      'wind_deg': instance.wind_deg,
      'wind_dir': instance.wind_dir,
      'wind_sc': instance.wind_sc,
      'wind_spd': instance.wind_spd
    };
