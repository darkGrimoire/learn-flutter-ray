import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_fvm/src/helpers/go_router_refresh_stream.dart';
import 'package:test_fvm/src/models/restaurant.dart';
import 'package:test_fvm/src/new_navigation_bar.dart';
import 'package:test_fvm/src/screens/about.dart';
import 'package:test_fvm/src/screens/new_home.dart';
import 'package:test_fvm/src/screens/profile.dart';
import 'package:test_fvm/src/screens/restaurant_detail.dart';
import 'package:test_fvm/src/screens/login.dart';
import 'package:test_fvm/src/services/auth.dart';

class AppRouter {
  // Initialize keys to differentiate the navigator between screens.
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    // Used for debugging purposes.
    debugLogDiagnostics: true,
    routes: [
      // ShellRoute will makes NavigationBar persistent in the same navigator key.
      // It will only shown if the navigator key is _shellNavigatorKey.
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => NewNavigationBar(
          location: state.matchedLocation,
          child: child,
        ),
        routes: [
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: "/",
            name: "home",
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: NewRestaurantHomePage()),
            routes: [
              // Since we don't need the navigation bar to be shown in the child route,
              // just use a different navigator key instead.
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: "restaurant_detail/:id",
                name: "restaurant_detail",
                builder: (context, state) {
                  Restaurant restaurant =
                      Restaurant.fromJson(state.extra as Map<String, dynamic>);
                  return RestaurantDetailPage(restaurant: restaurant);
                },
              )
            ],
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: "/profile",
            name: "profile",
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProfilePage()),
          ),
        ],
      ),
      // Outside of the shell Route since it doesn't need navigation bar.
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: "/login",
        name: "login",
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: "/about",
        name: "about",
        builder: (context, state) => const AboutPage(),
      ),
    ],
    // Applies the logic of old_root.dart into this middleware function.
    redirect: (context, state) {
      bool loggedIn = Auth.getUser != "";
      bool loggingIn = state.matchedLocation == "/login";

      if (!loggedIn) {
        return "/login";
      }

      if (loggingIn) {
        return "/";
      }

      return null;
    },
    // Listen to the auth changes.
    // GoRouterRefreshStream converts a stream into a Listenable.
    refreshListenable: GoRouterRefreshStream(Auth.getAuthStream()),
  );
}
