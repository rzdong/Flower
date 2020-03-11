// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'lifestyle.g.dart';

@JsonSerializable()
class Lifestyle {
    Lifestyle();

    String type;
    String brf;
    String txt;
    
    factory Lifestyle.fromJson(Map<String,dynamic> json) => _$LifestyleFromJson(json);
    Map<String, dynamic> toJson() => _$LifestyleToJson(this);
}
