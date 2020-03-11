// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weatherLifestyle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherLifestyle _$WeatherLifestyleFromJson(Map<String, dynamic> json) {
  return WeatherLifestyle()
    ..basic = json['basic'] == null
        ? null
        : Basic.fromJson(json['basic'] as Map<String, dynamic>)
    ..update = json['update'] == null
        ? null
        : Update.fromJson(json['update'] as Map<String, dynamic>)
    ..status = json['status'] as String
    ..lifestyle = json['lifestyle'] == null
        ? null
        : Lifestyle.fromJson(json['lifestyle'] as Map<String, dynamic>);
}

Map<String, dynamic> _$WeatherLifestyleToJson(WeatherLifestyle instance) =>
    <String, dynamic>{
      'basic': instance.basic,
      'update': instance.update,
      'status': instance.status,
      'lifestyle': instance.lifestyle
    };
