// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import "basic.dart";
import "update.dart";
import "now.dart";
part 'weatherNow.g.dart';

@JsonSerializable()
class WeatherNow {
    WeatherNow();

    Basic basic;
    Update update;
    String status;
    Now now;
    
    factory WeatherNow.fromJson(Map<String,dynamic> json) => _$WeatherNowFromJson(json);
    Map<String, dynamic> toJson() => _$WeatherNowToJson(this);
}
