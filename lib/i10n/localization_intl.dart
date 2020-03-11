import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart'; //1

class WeatherLocalizations {
  static Future<WeatherLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return new WeatherLocalizations();
    });
  }

  static WeatherLocalizations of(BuildContext context) {
    return Localizations.of<WeatherLocalizations>(context, WeatherLocalizations);
  }

  String get weather {
    return Intl.message(
      'Weather',
      name: 'weather',
      desc: 'this is weather',
    );
  }

  String get content {
    return Intl.message(
      'content',
      name: 'content',
      desc: 'this is content',
    );
  }
}


class WeatherLocalizationsDelegate extends LocalizationsDelegate<WeatherLocalizations> {
  const WeatherLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<WeatherLocalizations> load(Locale locale) {
    return WeatherLocalizations.load(locale);
  }

  @override
  bool shouldReload(WeatherLocalizationsDelegate old) => false;
}