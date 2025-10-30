part of 'app_bloc.dart';

class AppState extends Equatable {
  final ThemeMode themeMode;

  const AppState({this.themeMode = ThemeMode.system});

  AppState copyWith({ThemeMode? themeMode}) =>
      AppState(themeMode: themeMode ?? this.themeMode);

  @override
  List<Object> get props => [themeMode];
}

extension ThemeModeX on ThemeMode {
  bool get isDark => this == ThemeMode.dark;

  bool get isLight => this == ThemeMode.light;

  bool get isSystem => this == ThemeMode.system;
}
