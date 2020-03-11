// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Setting _$SettingFromJson(Map<String, dynamic> json) {
  return Setting()
    ..language = json['language'] as String
    ..enableUpdateAtNight = json['enableUpdateAtNight'] as bool
    ..temperatureUnit = json['temperatureUnit'] as String
    ..pushWeather = json['pushWeather'] as bool
    ..weatherUpdateTime = json['weatherUpdateTime'] as num;
}

Map<String, dynamic> _$SettingToJson(Setting instance) => <String, dynamic>{
      'language': instance.language,
      'enableUpdateAtNight': instance.enableUpdateAtNight,
      'temperatureUnit': instance.temperatureUnit,
      'pushWeather': instance.pushWeather,
      'weatherUpdateTime': instance.weatherUpdateTime
    };
