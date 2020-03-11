// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'update.g.dart';

@JsonSerializable()
class Update {
    Update();

    String loc;
    String utc;
    
    factory Update.fromJson(Map<String,dynamic> json) => _$UpdateFromJson(json);
    Map<String, dynamic> toJson() => _$UpdateToJson(this);
}
