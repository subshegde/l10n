import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeController with ChangeNotifier {
  Locale _appLocale = const Locale('kn', 'IN'); // default fallback

  Locale get appLocale => _appLocale;

  Future<void> setLocale(Locale locale) async {
    _appLocale = locale;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', locale.languageCode);
  }

  Future<void> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    String? langCode = prefs.getString('lang');

    if (langCode != null) {
      switch (langCode) {
        case 'en':
          _appLocale = const Locale('en', 'US');
          break;
        case 'es':
          _appLocale = const Locale('es', 'ES');
          break;
        case 'kn':
          _appLocale = const Locale('kn', 'IN');
          break;
        default:
          _appLocale = const Locale('en', 'US');
      }
    }

    notifyListeners();
  }
}
