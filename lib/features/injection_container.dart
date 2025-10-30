import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:web_devop/core/network/network_info.dart';
import 'package:web_devop/features/app/presentation/bloc/app_bloc.dart';
import 'package:web_devop/features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;
// late Box<dynamic> _box;

Future<void> initInjection() async {
  /// Data Sources
  if (!kIsWeb) await initHive();

  /// initOthers
  initOthers();

  /// State Managements
  initStateManagements();

  /// Local Data Sources
  initLocalDataSources();

  /// Remote Data Sources
  initRemoteDataSource();

  /// UseCases
  initUseCases();

  /// Repositories
  initRepositories();
}

void initOthers() {
  sl.registerLazySingleton(() => InternetConnectionChecker.instance);
  sl.registerLazySingleton<NetworkInfoImpl>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(
        contentType: 'application/json',
        sendTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
      )
      ..interceptors.addAll([
        LogInterceptor(
          error: kDebugMode,
          request: kDebugMode,
          requestBody: kDebugMode,
          responseBody: kDebugMode,
        ),
      ]),
  );
}

void initStateManagements() {
  /// App
  sl.registerSingleton<AppBloc>(AppBloc());

  /// home
  sl.registerFactory<HomeBloc>(
    () => HomeBloc(),
  );
}

/// Use Cases
void initUseCases() {}

/// Repositories
void initRepositories() {}

/// Remote Data Sources
void initRemoteDataSource() {}

void initLocalDataSources() {}

Future<void> initHive() async {
  // const boxName = 'rika_morti_box';
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  // _box = await Hive.openBox<dynamic>(boxName);
}
