

import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale localeApp = const Locale("en");

  Locale get getLocale => localeApp;

  setLocale(Locale newLocale) {
    localeApp = newLocale;
    notifyListeners();
  }

}