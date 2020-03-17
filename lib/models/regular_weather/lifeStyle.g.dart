// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifeStyle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LifeStyle _$LifeStyleFromJson(Map<String, dynamic> json) {
  return LifeStyle()
    ..type = json['type'] as String
    ..brf = json['brf'] as String
    ..txt = json['txt'] as String;
}

Map<String, dynamic> _$LifeStyleToJson(LifeStyle instance) => <String, dynamic>{
      'type': instance.type,
      'brf': instance.brf,
      'txt': instance.txt
    };
