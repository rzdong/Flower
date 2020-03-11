// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'now.g.dart';

@JsonSerializable()
class Now {
    Now();

    String cloud;
    String cond_code;
    String cond_txt;
    String fl;
    String hum;
    String pcpn;
    String pres;
    String tmp;
    String vis;
    String wind_deg;
    String wind_dir;
    String wind_sc;
    String wind_spd;
    
    factory Now.fromJson(Map<String,dynamic> json) => _$NowFromJson(json);
    Map<String, dynamic> toJson() => _$NowToJson(this);
}
