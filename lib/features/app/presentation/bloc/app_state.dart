part of 'app_bloc.dart';

class AppState extends Equatable {
  final ThemeMode themeMode;
  final Locale locale;

  const AppState({
    this.themeMode = ThemeMode.system,
    this.locale = const Locale('en'),
  });

  AppState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
  }) =>
      AppState(
        themeMode: themeMode ?? this.themeMode,
        locale: locale ?? this.locale,
      );

  @override
  List<Object> get props => [themeMode, locale];
}

extension ThemeModeX on ThemeMode {
  bool get isDark => this == ThemeMode.dark;

  bool get isLight => this == ThemeMode.light;

  bool get isSystem => this == ThemeMode.system;
}
