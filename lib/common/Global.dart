import 'dart:convert';
import 'package:fluttertest/models/setting.dart';
import 'package:fluttertest/service/Weather.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  // 插件
  static SharedPreferences _prefs;

  static Setting setting = Setting();

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();

    /// 读取setting设置
    var _setting = _prefs.getString("setting");
    if (_setting != null) {
      try {
        setting = Setting.fromJson(jsonDecode(_setting));
        print(_setting);
      } catch (e) {
        print(e);
      }
    }


    //初始化网络请求相关配置
    Weather.init();

  }
  // 持久化setting信息 
  static saveProfile() =>
    _prefs.setString("setting", jsonEncode(setting.toJson()));
} 