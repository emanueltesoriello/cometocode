import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../resources/app_localization_it.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  static const delegate = _AppLocalizationsDelegate();

  final Locale locale;

  String get appTitle =>
      _localizedValues[locale.languageCode]!['appTitle'] ?? '';

  String get description =>
      _localizedValues[locale.languageCode]!['description'] ?? '';

  String get goToHomeBtn =>
      _localizedValues[locale.languageCode]!['goToHomeBtn'] ?? '';

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    ...itLocalization,
  };
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['it'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) =>
      SynchronousFuture<AppLocalizations>(AppLocalizations(locale));

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
