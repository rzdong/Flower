// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weatherLifeStyle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherLifeStyle _$WeatherLifeStyleFromJson(Map<String, dynamic> json) {
  return WeatherLifeStyle()
    ..basic = json['basic'] == null
        ? null
        : Basic.fromJson(json['basic'] as Map<String, dynamic>)
    ..update = json['update'] == null
        ? null
        : Update.fromJson(json['update'] as Map<String, dynamic>)
    ..status = json['status'] as String
    ..lifestyle = (json['lifestyle'] as List)
        ?.map((e) =>
            e == null ? null : LifeStyle.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$WeatherLifeStyleToJson(WeatherLifeStyle instance) =>
    <String, dynamic>{
      'basic': instance.basic,
      'update': instance.update,
      'status': instance.status,
      'lifestyle': instance.lifestyle
    };
