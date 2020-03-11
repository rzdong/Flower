// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weatherNow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherNow _$WeatherNowFromJson(Map<String, dynamic> json) {
  return WeatherNow()
    ..basic = json['basic'] == null
        ? null
        : Basic.fromJson(json['basic'] as Map<String, dynamic>)
    ..update = json['update'] == null
        ? null
        : Update.fromJson(json['update'] as Map<String, dynamic>)
    ..status = json['status'] as String
    ..now = json['now'] == null
        ? null
        : Now.fromJson(json['now'] as Map<String, dynamic>);
}

Map<String, dynamic> _$WeatherNowToJson(WeatherNow instance) =>
    <String, dynamic>{
      'basic': instance.basic,
      'update': instance.update,
      'status': instance.status,
      'now': instance.now
    };
