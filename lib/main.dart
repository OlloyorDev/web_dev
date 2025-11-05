import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_devop/core/util/log_bloc_observer.dart';
import 'package:web_devop/features/app/presentation/app.dart';
import 'package:web_devop/features/injection_container.dart';
import 'package:web_devop/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  await initInjection();
  if (kDebugMode) Bloc.observer = LogBlocObserver();


  runApp(const App());
}
