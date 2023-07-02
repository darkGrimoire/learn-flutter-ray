import 'package:flutter/material.dart';
import 'package:test_fvm/src/new_router.dart';
import 'package:test_fvm/src/old_root.dart';

void main() {
  runApp(const NewRouterApp());
}

// Uses the imperative, v1 router of Flutter Navigation.
class OldRouterApp extends StatelessWidget {
  const OldRouterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Old Router App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: Typography.blackMountainView,
        useMaterial3: true,
      ),

      // Directly uses root instead of routes
      home: const Root(),
    );
  }
}

// Uses the declarative, router v2 of Flutter Navigation.
class NewRouterApp extends StatelessWidget {
  const NewRouterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Uses MaterialApp.router to uses router v2
    return MaterialApp.router(
      title: 'New Router App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: Typography.blackMountainView,
        useMaterial3: true,
      ),

      // Uses router configuration instead of direct widget.
      routerConfig: AppRouter().router,
    );
  }
}
