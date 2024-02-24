import 'package:juliotati/generated/l10n.dart';
import 'package:flutter/material.dart' show LocalizationsDelegate;
import 'package:flutter_localizations/flutter_localizations.dart';

List<LocalizationsDelegate<dynamic>> localizationDelegates() {
  return <LocalizationsDelegate<dynamic>>[
    AppLocal.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
