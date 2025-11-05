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
  observers: [GoRouterObserver()],
  routes: <RouteBase>[
    GoRoute(
      path: AppRouteNames.home,
      name: AppRouteNames.home,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => sl<HomeBloc>()..add(GetInitialData()),
          ),
        ],
        child: const HomeView(),
      ),
    ),
  ],
);

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('didPush: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('didPop: ${route.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('didRemove: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    debugPrint('didReplace: ${newRoute?.settings.name}');
  }
}
