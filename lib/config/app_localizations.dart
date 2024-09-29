import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;
  Map<String, dynamic> _localizedStrings = {};

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('assets/langs/${locale.languageCode}.json');
    _localizedStrings = json.decode(jsonString);
    return true;
  }

  String translate(String key) {
    List<String> keys = key.contains('.') ? key.split('.') : [key];
    dynamic currentMap = _localizedStrings;

    for (String k in keys) {
      if (currentMap.containsKey(k)) {
        currentMap = currentMap[k];
      } else {
        return "unknown";
        // return null; // Retorna null si no se encuentra la clave
      }
    }
    return currentMap.toString(); // Devuelve el valor directamente
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate old) => false;
}
