// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Update _$UpdateFromJson(Map<String, dynamic> json) {
  return Update()
    ..loc = json['loc'] as String
    ..utc = json['utc'] as String;
}

Map<String, dynamic> _$UpdateToJson(Update instance) =>
    <String, dynamic>{'loc': instance.loc, 'utc': instance.utc};
