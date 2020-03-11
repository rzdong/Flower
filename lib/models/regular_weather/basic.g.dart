// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Basic _$BasicFromJson(Map<String, dynamic> json) {
  return Basic()
    ..cid = json['cid'] as String
    ..location = json['location'] as String
    ..parent_city = json['parent_city'] as String
    ..admin_area = json['admin_area'] as String
    ..cnty = json['cnty'] as String
    ..lat = json['lat'] as String
    ..lon = json['lon'] as String
    ..tz = json['tz'] as String;
}

Map<String, dynamic> _$BasicToJson(Basic instance) => <String, dynamic>{
      'cid': instance.cid,
      'location': instance.location,
      'parent_city': instance.parent_city,
      'admin_area': instance.admin_area,
      'cnty': instance.cnty,
      'lat': instance.lat,
      'lon': instance.lon,
      'tz': instance.tz
    };
