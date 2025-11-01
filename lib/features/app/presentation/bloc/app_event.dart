part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();
}

class ChangeThemeEvent extends AppEvent {
  final ThemeMode themeMode;

  const ChangeThemeEvent(this.themeMode);

  @override
  List<Object?> get props => [themeMode];
}


class ChangeLanguageEvent extends AppEvent {
  final Locale locale;

  const ChangeLanguageEvent(this.locale);

  @override
  List<Object?> get props => [locale];
}