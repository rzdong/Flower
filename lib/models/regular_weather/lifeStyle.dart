// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'lifeStyle.g.dart';

@JsonSerializable()
class LifeStyle {
    LifeStyle();

    String type;
    String brf;
    String txt;
    
    factory LifeStyle.fromJson(Map<String,dynamic> json) => _$LifeStyleFromJson(json);
    Map<String, dynamic> toJson() => _$LifeStyleToJson(this);
}
