// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import "basic.dart";
import "update.dart";
import "lifeStyle.dart";
part 'weatherLifeStyle.g.dart';

@JsonSerializable()
class WeatherLifeStyle {
    WeatherLifeStyle();

    Basic basic;
    Update update;
    String status;
    List<LifeStyle> lifestyle;
    
    factory WeatherLifeStyle.fromJson(Map<String,dynamic> json) => _$WeatherLifeStyleFromJson(json);
    Map<String, dynamic> toJson() => _$WeatherLifeStyleToJson(this);
}
