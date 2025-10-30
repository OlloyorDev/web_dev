import 'package:flutter/material.dart';
import 'package:web_devop/core/theme/color/app_colors.dart';

const lightColorScheme = ColorScheme.light(
  surface: AppColors.lightBackground,
  brightness: Brightness.light,
);

const darkColorScheme = ColorScheme.dark(
  surface: AppColors.darkBackground,
  brightness: Brightness.dark,
);

class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.white,
    required this.black,
    required this.background,
    required this.cardBackground,
  });

  final Color white;
  final Color black;
  final Color background;
  final Color cardBackground;

  static ThemeColors light = const ThemeColors(
    white: AppColors.white,
    black: AppColors.black,
    background: AppColors.lightBackground,
    cardBackground: AppColors.lightCardBackground,
  );
  static const ThemeColors dark = ThemeColors(
    white: AppColors.white,
    black: AppColors.black,
    background: AppColors.darkBackground,
    cardBackground: AppColors.darkCardBackground,
  );

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? white,
    Color? black,
    Color? background,
    Color? cardBackground,
  }) =>
      ThemeColors(
        white: white ?? this.white,
        black: black ?? this.black,
        background: background ?? this.background,
        cardBackground: cardBackground ?? this.cardBackground,
      );

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      background: Color.lerp(background, other.background, t)!,
      cardBackground:
          Color.lerp(cardBackground, other.cardBackground, t)!,
    );
  }
}
