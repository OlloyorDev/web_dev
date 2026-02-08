import 'package:flutter/material.dart';
import 'package:web_devop/core/theme/color/app_colors.dart';

const lightColorScheme = ColorScheme.light(
  surface: AppColors.lightBackground,
  primary: AppColors.primaryLight,
  secondary: AppColors.secondaryLight,
  onSurface: AppColors.lightTextPrimary,
  onPrimary: Colors.white,
  outline: AppColors.lightDivider,
);

const darkColorScheme = ColorScheme.dark(
  surface: AppColors.darkBackground,
  primary: AppColors.primaryDark,
  secondary: AppColors.secondaryDark,
  onSurface: AppColors.darkTextPrimary,
  onPrimary: AppColors.darkBackground,
  outline: AppColors.darkDivider,
);

class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.background,
    required this.cardBackground,
    required this.textPrimary,
    required this.textSecondary,
    required this.divider,
  });

  final Color background;
  final Color cardBackground;
  final Color textPrimary;
  final Color textSecondary;
  final Color divider;

  static const ThemeColors light = ThemeColors(
    background: AppColors.lightBackground,
    cardBackground: AppColors.lightCard,
    textPrimary: AppColors.lightTextPrimary,
    textSecondary: AppColors.lightTextSecondary,
    divider: AppColors.lightDivider,
  );

  static const ThemeColors dark = ThemeColors(
    background: AppColors.darkBackground,
    cardBackground: AppColors.darkCard,
    textPrimary: AppColors.darkTextPrimary,
    textSecondary: AppColors.darkTextSecondary,
    divider: AppColors.darkDivider,
  );

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? background,
    Color? cardBackground,
    Color? textPrimary,
    Color? textSecondary,
    Color? divider,
  }) =>
      ThemeColors(
        background: background ?? this.background,
        cardBackground: cardBackground ?? this.cardBackground,
        textPrimary: textPrimary ?? this.textPrimary,
        textSecondary: textSecondary ?? this.textSecondary,
        divider: divider ?? this.divider,
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
      background: Color.lerp(background, other.background, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
    );
  }
}
