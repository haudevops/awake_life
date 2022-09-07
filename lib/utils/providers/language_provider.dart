import 'package:flutter/material.dart';
import 'package:awake_life/utils/util_export.dart';

class LanguageProvider with ChangeNotifier {
  late Locale _currentLocale;

  Locale get currentLocale => _currentLocale;

  LanguageProvider() {
    _getLanguageLocal();
  }

  void _getLanguageLocal() async {
    String? languageLocal = PrefsUtil.getString(PrefsCache.LANGUAGE_CHANGE);
    if (languageLocal != null && languageLocal.isNotEmpty) {
      _currentLocale = Locale(languageLocal);
    } else {
      _currentLocale = const Locale(Constants.VIETNAMESE);
    }
  }

  void changeLocale(String locale) {
    _currentLocale = Locale(locale);
    PrefsUtil.putString(PrefsCache.LANGUAGE_CHANGE, locale);
    notifyListeners();
  }
}
