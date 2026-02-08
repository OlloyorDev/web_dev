import 'package:flutter/material.dart';
import 'package:web_devop/core/theme/color/app_colors.dart';
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
  scaffoldBackgroundColor: AppColors.lightBackground,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.lightTextPrimary, fontFamily: 'Montserrat'),
    bodyMedium: TextStyle(color: AppColors.lightTextPrimary, fontFamily: 'Montserrat'),
    bodySmall: TextStyle(color: AppColors.lightTextPrimary, fontFamily: 'Montserrat'),
  ),
);

final ThemeData darkTheme = appTheme.copyWith(
  extensions: <ThemeExtension<dynamic>>[
    ThemeColors.dark,
  ],
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: AppColors.darkBackground,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.darkTextPrimary, fontFamily: 'Montserrat'),
    bodyMedium: TextStyle(color: AppColors.darkTextPrimary, fontFamily: 'Montserrat'),
    bodySmall: TextStyle(color: AppColors.darkTextPrimary, fontFamily: 'Montserrat'),
  ),
);
