import 'package:defy/features/splash/splash_screen.dart';
import 'package:defy/features/onboarding/onboarding_screen.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'splash_route.dart';
part 'onboarding_route.dart';
part 'generated/router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  return GoRouter(
    initialLocation: const SplashRoute().location,
    routes: $appRoutes,
    redirect: (BuildContext context, GoRouterState state) {
      // Add your redirect logic here if needed
      // For example, checking if the user has completed onboarding
      return null;
    },
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text('Page not found'),
      ),
    ),
  );
}