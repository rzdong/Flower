 import 'package:flutter/widgets.dart';
import 'package:fluttertest/common/Global.dart';
import 'package:fluttertest/models/setting.dart';

class SettingModel extends ChangeNotifier {
  Setting get setting => Global.setting;

  /// 
  Locale getLanguage() {
    if (setting.language == null) return null;
    var t = setting.language.split('_');
    return Locale(t[0], t[1]);
  }

  String get language => setting.language;

  set language(String language) {
    if (language != setting.language) {
      setting.language = language;
      // 语言有更改，持久存储
      Global.saveProfile();
      notifyListeners();
    }
  }
}