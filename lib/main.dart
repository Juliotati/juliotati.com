import 'package:flutter/material.dart';
import 'package:juliotati/core/localization_delegate.dart';
import 'package:juliotati/core/router/config.dart';
import 'package:juliotati/core/theme/app_themes.dart';
import 'package:juliotati/translations/l10n.dart';

void main() {
  runApp(const JulioTatiApp());
}

class JulioTatiApp extends StatelessWidget {
  const JulioTatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Júlio Tati',
      theme: AppTheme.data(darkMode: false),
      darkTheme: AppTheme.data(),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      themeAnimationCurve: Curves.easeInOut,
      supportedLocales: AppLocal.delegate.supportedLocales,
      localizationsDelegates: localizationDelegates(),
    );
  }
}
