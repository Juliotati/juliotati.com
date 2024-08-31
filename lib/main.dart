import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:juliotati/core/config/app_config.dart';
import 'package:juliotati/core/config/app_providers.dart';
import 'package:juliotati/core/config/providers/app_settings_provider.dart';
import 'package:juliotati/core/localization_delegate.dart';
import 'package:juliotati/core/router/config.dart';
import 'package:juliotati/core/theme/app_themes.dart';
import 'package:juliotati/translations/l10n.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await AppConfig.initialize();
  runApp(const JulioTatiApp());
  SemanticsBinding.instance.ensureSemantics();
}

class JulioTatiApp extends StatelessWidget {
  const JulioTatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: Consumer<AppSettingsProvider>(
        builder: (context, provider, ___) {
          return MaterialApp.router(
            title: 'Júlio Tati',
            locale: provider.locale,
            theme: AppTheme.data(darkMode: false),
            darkTheme: AppTheme.data(),
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
            themeAnimationCurve: Curves.easeInOut,
            supportedLocales: AppLocal.delegate.supportedLocales,
            localizationsDelegates: localizationDelegates(),
          );
        },
      ),
    );
  }
}
