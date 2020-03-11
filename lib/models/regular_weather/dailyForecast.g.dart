// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dailyForecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyForecast _$DailyForecastFromJson(Map<String, dynamic> json) {
  return DailyForecast()
    ..cond_code_d = json['cond_code_d'] as String
    ..cond_code_n = json['cond_code_n'] as String
    ..cond_txt_d = json['cond_txt_d'] as String
    ..cond_txt_n = json['cond_txt_n'] as String
    ..date = json['date'] as String
    ..hum = json['hum'] as String
    ..pcpn = json['pcpn'] as String
    ..pop = json['pop'] as String
    ..pres = json['pres'] as String
    ..sr = json['sr'] as String
    ..ss = json['ss'] as String
    ..tmp_max = json['tmp_max'] as String
    ..tmp_min = json['tmp_min'] as String
    ..uv_index = json['uv_index'] as String
    ..vis = json['vis'] as String
    ..wind_deg = json['wind_deg'] as String
    ..wind_dir = json['wind_dir'] as String
    ..wind_sc = json['wind_sc'] as String
    ..wind_spd = json['wind_spd'] as String;
}

Map<String, dynamic> _$DailyForecastToJson(DailyForecast instance) =>
    <String, dynamic>{
      'cond_code_d': instance.cond_code_d,
      'cond_code_n': instance.cond_code_n,
      'cond_txt_d': instance.cond_txt_d,
      'cond_txt_n': instance.cond_txt_n,
      'date': instance.date,
      'hum': instance.hum,
      'pcpn': instance.pcpn,
      'pop': instance.pop,
      'pres': instance.pres,
      'sr': instance.sr,
      'ss': instance.ss,
      'tmp_max': instance.tmp_max,
      'tmp_min': instance.tmp_min,
      'uv_index': instance.uv_index,
      'vis': instance.vis,
      'wind_deg': instance.wind_deg,
      'wind_dir': instance.wind_dir,
      'wind_sc': instance.wind_sc,
      'wind_spd': instance.wind_spd
    };
