import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends ChangeNotifier {
  static const List<Locale> languageCodes = [
    Locale("en"),
    Locale("cs"),
    Locale("de"),
    Locale("es"),
    Locale("fr"),
    Locale("it"),
    Locale("ja"),
    Locale("pl"),
    Locale("pt", "BR"),
    Locale("ru"),
    Locale("sk"),
    Locale("tr"),
    Locale("zh"),
  ];

  final List<String> _languages = [
    "English",
    "Čeština",
    "Deutsch",
    "Español",
    "Français",
    "Italiano",
    "日本語",
    "Polski",
    "Português (Brasil)",
    "Русский",
    "Slovenčina",
    "Türkçe",
    "中文",
  ];

  late int _language;
  late bool _imperialUnits;
  late SharedPreferences _sharedPreferences;

  Settings({
    required language,
    required imperialUnits,
  }) {
    _language = language;
    _imperialUnits = imperialUnits;
  }

  bool get imperialUnits => _imperialUnits;

  int get language => _language;

  List<String> get languages => _languages;

  Locale getLocale(int index) => languageCodes[index];

  String getLocaleName(int index) => _languages[index];

  Future<void> changeUnits(bool imperialUnits) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _imperialUnits = imperialUnits;
    await _sharedPreferences.setBool("imperialUnits", imperialUnits);
    notifyListeners();
  }

  Future<void> changeLanguage(int languageId) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _language = languageId;
    await _sharedPreferences.setInt("language", languageId);
    notifyListeners();
  }
}
