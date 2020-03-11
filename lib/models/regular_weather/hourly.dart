// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'hourly.g.dart';

@JsonSerializable()
class Hourly {
    Hourly();

    String cloud;
    String cond_code;
    String cond_txt;
    String dew;
    String hum;
    String pop;
    String pres;
    String time;
    String tmp;
    String wind_deg;
    String wind_dir;
    String wind_sc;
    String wind_spd;
    
    factory Hourly.fromJson(Map<String,dynamic> json) => _$HourlyFromJson(json);
    Map<String, dynamic> toJson() => _$HourlyToJson(this);
}
