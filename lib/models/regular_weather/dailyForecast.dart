// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'dailyForecast.g.dart';

@JsonSerializable()
class DailyForecast {
    DailyForecast();

    String cond_code_d;
    String cond_code_n;
    String cond_txt_d;
    String cond_txt_n;
    String date;
    String hum;
    String pcpn;
    String pop;
    String pres;
    String sr;
    String ss;
    String tmp_max;
    String tmp_min;
    String uv_index;
    String vis;
    String wind_deg;
    String wind_dir;
    String wind_sc;
    String wind_spd;
    
    factory DailyForecast.fromJson(Map<String,dynamic> json) => _$DailyForecastFromJson(json);
    Map<String, dynamic> toJson() => _$DailyForecastToJson(this);
}
