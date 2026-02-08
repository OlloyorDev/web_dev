import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:web_devop/features/app/presentation/bloc/app_bloc.dart';
import 'package:web_devop/features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> initInjection() async {
  initOthers();
  initStateManagements();
}

void initOthers() {
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
  sl.registerSingleton<AppBloc>(AppBloc());
  sl.registerFactory<HomeBloc>(() => HomeBloc());
}
