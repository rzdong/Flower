// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import "basic.dart";
import "update.dart";
import "dailyForecast.dart";
part 'weatherForecast.g.dart';

@JsonSerializable()
class WeatherForecast {
    WeatherForecast();

    Basic basic;
    Update update;
    String status;
    List<DailyForecast> daily_forecast;
    
    factory WeatherForecast.fromJson(Map<String,dynamic> json) => _$WeatherForecastFromJson(json);
    Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);
}
