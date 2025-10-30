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
    required this.textPrimary,
    required this.textSecondary,
  });

  final Color white;
  final Color black;
  final Color background;
  final Color cardBackground;
  final Color textPrimary;
  final Color textSecondary;

  static ThemeColors light = const ThemeColors(
    white: AppColors.white,
    black: AppColors.black,
    background: AppColors.lightBackground,
    cardBackground: AppColors.lightCardBackground,
    textPrimary: AppColors.black,
    textSecondary: AppColors.black,
  );
  static const ThemeColors dark = ThemeColors(
    white: AppColors.black,
    black: AppColors.white,
    background: AppColors.darkBackground,
    cardBackground: AppColors.darkCardBackground,
    textPrimary: AppColors.white,
    textSecondary: AppColors.white,
  );

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? white,
    Color? black,
    Color? background,
    Color? cardBackground,
    Color? textPrimary,
    Color? textSecondary,
  }) =>
      ThemeColors(
        white: white ?? this.white,
        black: black ?? this.black,
        background: background ?? this.background,
        cardBackground: cardBackground ?? this.cardBackground,
        textPrimary: textPrimary ?? this.textPrimary,
        textSecondary: textSecondary ?? this.textSecondary,
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
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
    );
  }
}
