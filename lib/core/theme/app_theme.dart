import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_devop/core/theme/color_scheme/color_scheme.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'PublicSans',
  applyElevationOverlayColor: true,
  splashFactory: !kIsWeb
      ? Platform.isAndroid
          ? InkRipple.splashFactory
          : NoSplash.splashFactory
      : InkRipple.splashFactory,
  visualDensity: VisualDensity.standard,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
    ),
  ),
  dividerTheme: const DividerThemeData(thickness: 1),
);

final ThemeData lightTheme = appTheme.copyWith(
  extensions: <ThemeExtension<dynamic>>[
    // ThemeTextStyles.light,
    ThemeColors.light,
  ],
  applyElevationOverlayColor: true,
  visualDensity: VisualDensity.standard,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  dividerTheme: const DividerThemeData(thickness: 1),
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: lightColorScheme.surface,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black87),
    bodyMedium: TextStyle(color: Colors.black87),
    bodySmall: TextStyle(color: Colors.black87),
  ),
);

final ThemeData darkTheme = appTheme.copyWith(
  extensions: <ThemeExtension<dynamic>>[
    // ThemeTextStyles.light,
    ThemeColors.dark,
  ],
  applyElevationOverlayColor: true,
  visualDensity: VisualDensity.standard,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  dividerTheme: const DividerThemeData(thickness: 1),
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: darkColorScheme.surface,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white70),
    bodyMedium: TextStyle(color: Colors.white70),
    bodySmall: TextStyle(color: Colors.white70),
  ),
);
