// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import "basic.dart";
import "update.dart";
import "hourly.dart";
part 'weatherHourly.g.dart';

@JsonSerializable()
class WeatherHourly {
    WeatherHourly();

    Basic basic;
    Update update;
    String status;
    List<Hourly> hourly;
    
    factory WeatherHourly.fromJson(Map<String,dynamic> json) => _$WeatherHourlyFromJson(json);
    Map<String, dynamic> toJson() => _$WeatherHourlyToJson(this);
}
