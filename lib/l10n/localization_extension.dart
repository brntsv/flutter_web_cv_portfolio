import 'package:flutter/material.dart';

import 'generated/app_localizations.g.dart';

/// Extension to get the localized string from the context
extension LocalizationExtension on BuildContext {
  /// Get the localized string from the context
  AppLocalizations get l10n => AppLocalizations.of(this);

  /// Get the localized string from the context
  String get getCountryCode => Localizations.localeOf(this).languageCode;
}
