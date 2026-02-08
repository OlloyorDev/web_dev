import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_devop/features/home/data/model/resume_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetInitialData>(_getInitialData);
  }

  Future<void> _getInitialData(
    GetInitialData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(getStatus: GetStatus.loading));
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(minutes: 5),
      ));
      await remoteConfig.fetchAndActivate();

      final genericString = remoteConfig.getString('generic_data');
      final langString = remoteConfig.getString('resume_${event.languageCode}');

      if (langString.isEmpty) {
        emit(state.copyWith(getStatus: GetStatus.error));
        return;
      }

      String sanitize(String s) =>
          s.replaceAll(RegExp(r'[\x00-\x1F\x7F]', multiLine: true), ' ');

      final genericJson = genericString.isNotEmpty
          ? jsonDecode(sanitize(genericString)) as Map<String, dynamic>
          : <String, dynamic>{};
      final langJson = jsonDecode(sanitize(langString)) as Map<String, dynamic>;

      final merged = _deepMerge(genericJson, langJson);
      final resume = ResumeModel.fromJson(merged);

      emit(state.copyWith(
        getStatus: GetStatus.success,
        resumeData: resume,
      ));
    } catch (e, stackTrace) {
      debugPrint('Error fetching remote config: $e');
      debugPrint('Stack trace: $stackTrace');
      emit(state.copyWith(getStatus: GetStatus.error));
    }
  }

  static Map<String, dynamic> _deepMerge(
    Map<String, dynamic> base,
    Map<String, dynamic> override,
  ) {
    final result = Map<String, dynamic>.from(base);
    for (final key in override.keys) {
      final baseVal = result[key];
      final overVal = override[key];

      if (baseVal is Map<String, dynamic> && overVal is Map<String, dynamic>) {
        result[key] = _deepMerge(baseVal, overVal);
      } else if (baseVal is List && overVal is List) {
        result[key] = _mergeList(baseVal, overVal);
      } else {
        result[key] = overVal;
      }
    }
    return result;
  }

  static List<dynamic> _mergeList(List<dynamic> base, List<dynamic> override) {
    final result = <dynamic>[];
    final length =
        base.length > override.length ? base.length : override.length;
    for (int i = 0; i < length; i++) {
      final b = i < base.length ? base[i] : null;
      final o = i < override.length ? override[i] : null;

      if (b is Map<String, dynamic> && o is Map<String, dynamic>) {
        result.add(_deepMerge(b, o));
      } else {
        result.add(o ?? b);
      }
    }
    return result;
  }
}
