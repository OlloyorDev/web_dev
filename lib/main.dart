import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_devop/core/util/log_bloc_observer.dart';
import 'package:web_devop/features/app/presentation/app.dart';
import 'package:web_devop/features/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();
  if (kDebugMode) Bloc.observer = LogBlocObserver();


  runApp(const App());
}
