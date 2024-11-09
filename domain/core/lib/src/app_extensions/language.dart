import 'package:flutter/material.dart';

mixin AppLocaleConfig {
  static const String fallbackLocale = 'ru';
  static const String localePath = 'packages/core/assets/translations';

  static const List<Locale> supportedLocales = [
    Locale('ru'),
    Locale('uz'),
    Locale('en'),
  ];
}

enum AppLanguages { ru, uz, en }

extension LocaleExt on Locale {
  AppLanguages currentLanguage() {
    return AppLanguages.values.firstWhere((element) {
      return element.name == languageCode;
    });
  }
}
