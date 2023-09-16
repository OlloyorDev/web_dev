import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:web_devop/config/log_bloc_observer.dart';
import 'package:web_devop/src/login/bloc/login_bloc.dart';
import 'package:web_devop/src/login/data/login/auth_repository.dart';
import 'package:web_devop/src/login/presentation/login_page.dart';

void main() {
  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onx',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => LoginBloc(AuthRepositoryImpl(Dio())),
        child: const LoginScreen(),
      ),
    );
  }
}
