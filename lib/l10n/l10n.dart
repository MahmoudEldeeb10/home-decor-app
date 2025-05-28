import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../l10n/arb/app_localizations.dart';
import '../l10n/custom_delegate.dart';

class L10n {
  static Locale currentLocale = supportedLocales.first;

  static final List<Locale> supportedLocales = [
    const Locale('en', ''),
    const Locale('ar', ''),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'en':
        return '🇺🇸';
      case 'ar':
        return '🇸🇦';
      default:
        return '🇺🇸';
    }
  }

  static Locale defaultLocale = const Locale('en', '');

  static Locale localeListResolutionCallback(
    Iterable<Locale>? preferredLocales,
    Iterable<Locale>? supportedLocales,
  ) {
    if (preferredLocales == null) {
      return defaultLocale;
    }

    final Iterable<String> preferredLanguageCodes = preferredLocales.map((
      Locale p,
    ) {
      return p.languageCode;
    });
    final Iterable<String> supportedLanguageCodes = supportedLocales!.map((
      Locale s,
    ) {
      return s.languageCode;
    });
    final resolvedLanguageCode = preferredLanguageCodes.firstWhere(
      supportedLanguageCodes.contains,
      orElse: () {
        return defaultLocale.languageCode;
      },
    );

    return Locale(resolvedLanguageCode, '');
  }

  static List<LocalizationsDelegate<Object>> localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    FallbackLocalizationDelegate(),
  ];
}
