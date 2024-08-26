import 'package:flutter/material.dart'
    show BuildContext, ColorScheme, TextTheme, Theme, ThemeData;
import 'package:juliotati/translations/l10n.dart';

extension ExtBuildContext on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  AppLocal get i18n => AppLocal.of(this);
}
