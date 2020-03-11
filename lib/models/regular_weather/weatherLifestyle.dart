// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import "basic.dart";
import "update.dart";
import "lifestyle.dart";
part 'weatherLifestyle.g.dart';

@JsonSerializable()
class WeatherLifestyle {
    WeatherLifestyle();

    Basic basic;
    Update update;
    String status;
    Lifestyle lifestyle;
    
    factory WeatherLifestyle.fromJson(Map<String,dynamic> json) => _$WeatherLifestyleFromJson(json);
    Map<String, dynamic> toJson() => _$WeatherLifestyleToJson(this);
}
