import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_devop/config/router/app_router.dart';
import 'package:web_devop/core/theme/app_theme.dart';
import 'package:web_devop/features/app/presentation/bloc/app_bloc.dart';
import 'package:web_devop/features/injection_container.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => sl<AppBloc>(),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              themeMode: state.themeMode,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeAnimationDuration: Duration.zero,
              themeAnimationCurve: Curves.linear,
              routerDelegate: router.routerDelegate,
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
            );
          },
        ),
      );
}
