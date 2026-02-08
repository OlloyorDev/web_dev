import 'package:flutter/material.dart';
import 'package:web_devop/core/theme/color_scheme/color_scheme.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Montserrat',
  applyElevationOverlayColor: true,
  splashFactory: InkRipple.splashFactory,
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
    ThemeColors.light,
  ],
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: lightColorScheme.surface,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black87, fontFamily: 'Montserrat'),
    bodyMedium: TextStyle(color: Colors.black87, fontFamily: 'Montserrat'),
    bodySmall: TextStyle(color: Colors.black87, fontFamily: 'Montserrat'),
  ),
);

final ThemeData darkTheme = appTheme.copyWith(
  extensions: <ThemeExtension<dynamic>>[
    ThemeColors.dark,
  ],
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: darkColorScheme.surface,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white70, fontFamily: 'Montserrat'),
    bodyMedium: TextStyle(color: Colors.white70, fontFamily: 'Montserrat'),
    bodySmall: TextStyle(color: Colors.white70, fontFamily: 'Montserrat'),
  ),
);
