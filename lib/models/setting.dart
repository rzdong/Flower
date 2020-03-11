// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'setting.g.dart';

@JsonSerializable()
class Setting {
    Setting();

    String language;
    bool enableUpdateAtNight;
    String temperatureUnit;
    bool pushWeather;
    num weatherUpdateTime;
    
    factory Setting.fromJson(Map<String,dynamic> json) => _$SettingFromJson(json);
    Map<String, dynamic> toJson() => _$SettingToJson(this);
}
