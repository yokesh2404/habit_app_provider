import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/src/core/route/app_route_name.dart';
import 'package:habit_tracker/src/features/home/presentation/pages/home_screen.dart';
import 'package:habit_tracker/src/features/splash/presentation/pages/splash_screen.dart';

class Routes {
  static GoRouter route = GoRouter(
    initialLocation: AppRouteName.splash,
    observers: [RouteLogger()],
    routes: [
      GoRoute(
        path: AppRouteName.splash,
        name: AppRouteName.splashName,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: AppRouteName.home,
        name: AppRouteName.homeName,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
    ],
  );
}

class RouteLogger extends NavigatorObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);

    debugPrint('Popped: ${route.settings.name}');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint('Pushed: ${route.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    debugPrint('Removed: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    debugPrint(
      'Old Route: ${oldRoute?.settings.name} -> Old Route: ${newRoute?.settings.name}',
    );
  }
}
