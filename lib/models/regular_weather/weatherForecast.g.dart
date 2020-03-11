// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weatherForecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecast _$WeatherForecastFromJson(Map<String, dynamic> json) {
  return WeatherForecast()
    ..basic = json['basic'] == null
        ? null
        : Basic.fromJson(json['basic'] as Map<String, dynamic>)
    ..update = json['update'] == null
        ? null
        : Update.fromJson(json['update'] as Map<String, dynamic>)
    ..status = json['status'] as String
    ..daily_forecast = (json['daily_forecast'] as List)
        ?.map((e) => e == null
            ? null
            : DailyForecast.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$WeatherForecastToJson(WeatherForecast instance) =>
    <String, dynamic>{
      'basic': instance.basic,
      'update': instance.update,
      'status': instance.status,
      'daily_forecast': instance.daily_forecast
    };
