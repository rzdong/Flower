import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/models/setting.dart';
import 'package:fluttertest/service/Weather.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Global {
  // 插件
  static SharedPreferences _prefs;

  static Setting setting = Setting();

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  static BuildContext context; // 保存当前页面上下文，路由跳转可能会用到

  static Future init() async {

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    
    var initializationSettingsAndroid = AndroidInitializationSettings('app_notif_icon');

    var initializationSettingsIOS = IOSInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    var initializationSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);

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

  // android通知回调
  static Future<void> onSelectNotification(String payload) async {
    if (payload != null) {
      print('notification payload: ' + payload);
    }
    Navigator.pushNamed(context, "addcity");
  }
  // ios通知回调
  static Future<void> onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    print('ios');
  }

  // 封装的通知，增加context参数
  static Future flutterNotificationShow(
    int id, String title, String body, NotificationDetails notificationDetails, {String payload, BuildContext context}
  ) async  {
    context = context;
    await Global.flutterLocalNotificationsPlugin.show(
      id, title, body, notificationDetails, payload: payload);
  }


  



  // 持久化setting信息 
  static saveProfile() =>
    _prefs.setString("setting", jsonEncode(setting.toJson()));
} 