import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertest/routes/Language.dart';
import 'package:provider/provider.dart';
import 'package:bot_toast/bot_toast.dart';

import 'i10n/localization_intl.dart';

import 'common/SettingModel.dart';
import 'common/Global.dart';

import 'routes/AddCity.dart';
import 'routes/Browser.dart';
import 'routes/CityManager.dart';
import 'routes/Home.dart';
import 'routes/Settings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((e) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingModel())
      ],
      child: Consumer<SettingModel>(
        builder: (BuildContext context, settingModel, Widget child) {
          return BotToastInit(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateTitle: (context){
                return WeatherLocalizations.of(context).weather;
              },
              locale: settingModel.getLanguage(),
              supportedLocales: [
                const Locale('en', 'US'), // 美国英语
                const Locale('zh', 'CN'), // 中文简体
              ],
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                WeatherLocalizationsDelegate()
              ],
              localeResolutionCallback: (Locale _locale, Iterable<Locale> supportedLocales) {
                print(_locale);
                if (settingModel.getLanguage() != null) { // 获取本地存储的语言
                  return settingModel.getLanguage();
                } else {
                  Locale locale;
                  if (supportedLocales.contains(_locale)) {
                    locale = _locale;
                  } else {
                    print(_locale);
                    locale = Locale('zh', 'CN');
                  }
                  return locale;
                }
              },
              initialRoute:"/",
              navigatorObservers: [BotToastNavigatorObserver()],
              routes: <String, WidgetBuilder>{
                '/': (context) => Home(),
                'addcity': (context) => AddCity(),
                'browser': (context) => Browser(),
                'citymanager': (context) => CityManager(),
                'settings': (context) => Settings(),
                'language': (context) => Language(),
              },
            )
          );
        }
      ),
    );
  }
}
