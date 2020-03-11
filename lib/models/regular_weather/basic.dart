// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'basic.g.dart';

@JsonSerializable()
class Basic {
    Basic();

    String cid;
    String location;
    String parent_city;
    String admin_area;
    String cnty;
    String lat;
    String lon;
    String tz;
    
    factory Basic.fromJson(Map<String,dynamic> json) => _$BasicFromJson(json);
    Map<String, dynamic> toJson() => _$BasicToJson(this);
}
