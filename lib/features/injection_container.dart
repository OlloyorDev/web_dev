import 'package:get_it/get_it.dart';
import 'package:web_devop/features/app/presentation/bloc/app_bloc.dart';
import 'package:web_devop/features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> initInjection() async {
  sl.registerSingleton<AppBloc>(AppBloc());
  sl.registerFactory<HomeBloc>(() => HomeBloc());
}
