import 'package:cometocode/resources/app_localization.dart';
import 'package:flutter/material.dart';

extension AppLocalizationMapper on BuildContext {
  AppLocalizations? getAppLocalizations() => AppLocalizations.of(this);
}
