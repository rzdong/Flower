// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifestyle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lifestyle _$LifestyleFromJson(Map<String, dynamic> json) {
  return Lifestyle()
    ..type = json['type'] as String
    ..brf = json['brf'] as String
    ..txt = json['txt'] as String;
}

Map<String, dynamic> _$LifestyleToJson(Lifestyle instance) => <String, dynamic>{
      'type': instance.type,
      'brf': instance.brf,
      'txt': instance.txt
    };
