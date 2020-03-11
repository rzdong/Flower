// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weatherHourly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherHourly _$WeatherHourlyFromJson(Map<String, dynamic> json) {
  return WeatherHourly()
    ..basic = json['basic'] == null
        ? null
        : Basic.fromJson(json['basic'] as Map<String, dynamic>)
    ..update = json['update'] == null
        ? null
        : Update.fromJson(json['update'] as Map<String, dynamic>)
    ..status = json['status'] as String
    ..hourly = (json['hourly'] as List)
        ?.map((e) =>
            e == null ? null : Hourly.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$WeatherHourlyToJson(WeatherHourly instance) =>
    <String, dynamic>{
      'basic': instance.basic,
      'update': instance.update,
      'status': instance.status,
      'hourly': instance.hourly
    };
