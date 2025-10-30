import 'package:flutter/material.dart';
import 'package:web_devop/core/l10n/app_localizations.dart';
import 'package:web_devop/core/theme/color_scheme/color_scheme.dart';

extension BuildContextExt on BuildContext {
  Locale get kLocale => Localizations.localeOf(this);

  String tr(String key) => AppLocalizations.of(this).translate(key);

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  ThemeColors get themeColor => Theme.of(this).extension<ThemeColors>()!;
}
