import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final class AppTheme {
  const AppTheme._();

  static ThemeData data({bool darkMode = true}) {
    final helper = _AppThemeHelper(darkMode: darkMode);
    return ThemeData(
      textTheme: TextTheme(
        displayLarge: helper.displayFontStyle(),
        displayMedium: helper.displayFontStyle(),
        displaySmall: helper.displayFontStyle(),
        headlineLarge: helper.headingFontStyle(),
        headlineMedium: helper.headingFontStyle(),
        headlineSmall: helper.headingFontStyle(),
        titleLarge: helper.headingFontStyle(),
        titleMedium: helper.headingFontStyle(),
        titleSmall: helper.headingFontStyle(),
        bodyLarge: helper.bodyFontStyle(),
        bodyMedium: helper.bodyFontStyle(),
        bodySmall: helper.bodyFontStyle(),
        labelLarge: helper.bodyFontStyle(),
        labelMedium: helper.bodyFontStyle(),
        labelSmall: helper.bodyFontStyle(),
      ),
      colorScheme: helper.scheme(),
      cardTheme: helper.cardTheme(),
      textSelectionTheme: helper.textSelectionTheme(),
    );
  }
}

final class _AppThemeHelper {
  const _AppThemeHelper({required this.darkMode});

  final bool darkMode;

  ColorScheme scheme() {
    if (darkMode) {
      return ColorScheme.dark(primary: Colors.blue[900]!);
    }
    return const ColorScheme.light(primary: Colors.black);
  }

  CardTheme cardTheme() {
    return CardTheme(elevation: darkMode ? 5.0 : 1.0);
  }

  TextSelectionThemeData textSelectionTheme() {
    final color = darkMode ? Colors.blue[900] : Colors.black;
    return TextSelectionThemeData(
      cursorColor: color,
      selectionColor: color,
      selectionHandleColor: color,
    );
  }

  TextStyle displayFontStyle() {
    return GoogleFonts.expletusSans();
  }

  TextStyle headingFontStyle() {
    return GoogleFonts.firaSans();
  }

  TextStyle bodyFontStyle() {
    return GoogleFonts.assistant();
  }
}
