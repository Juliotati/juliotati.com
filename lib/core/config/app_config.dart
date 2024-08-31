import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:juliotati/core/links.dart';
import 'package:juliotati/core/router/app_tab.dart';
import 'package:juliotati/firebase_options.dart';
import 'package:logger/logger.dart';
import 'package:url_strategy/url_strategy.dart';

final logMin = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    lineLength: 40,
    colors: true,
    printEmojis: true,
  ),
);

final class AppEnv {
  const AppEnv._();

  static bool get isProduction => kReleaseMode;

  static bool get isDevelopment => kDebugMode;

  static bool get isStaging => kProfileMode;
}

class AppConfig {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    setPathUrlStrategy();

    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      logMin.i('INITIALIZED FIREBASE APP');
    } catch (error) {
      logMin.e(
        'UNABLE TO INITIALIZE FIREBASE APP',
        error: [error, StackTrace.current],
      );
    }
  }

  static String? get redirectStrategy {
    final base = Uri.base;
    if (base.host.contains(Links.firebaseHost)) return Links.myWebsite;
    if (base.path.toLowerCase().contains('home')) return AppTab.home.path;

    return null;
  }
}
