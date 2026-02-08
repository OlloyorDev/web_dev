import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:web_devop/features/home/presentation/bloc/home_bloc.dart';
import 'package:web_devop/features/home/presentation/pages/home_view.dart';
import 'package:web_devop/features/injection_container.dart';

import 'app_route_names.dart';

final rootKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  navigatorKey: rootKey,
  initialLocation: AppRouteNames.home,
  routes: <RouteBase>[
    GoRoute(
      path: AppRouteNames.home,
      name: AppRouteNames.home,
      builder: (context, state) => BlocProvider<HomeBloc>(
        create: (context) =>
            sl<HomeBloc>()..add(const GetInitialData(languageCode: 'en')),
        child: const HomeView(),
      ),
    ),
  ],
);
