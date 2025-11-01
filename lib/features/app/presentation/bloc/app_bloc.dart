import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<ChangeThemeEvent>(_changeTheme);
    on<ChangeLanguageEvent>(_changeLanguage);
  }

  void _changeTheme(
    ChangeThemeEvent event,
    Emitter<AppState> emit,
  ) =>
      emit(state.copyWith(themeMode: event.themeMode));

  void _changeLanguage(
    ChangeLanguageEvent event,
    Emitter<AppState> emit,
  ) =>
      emit(state.copyWith(locale: event.locale));
}
