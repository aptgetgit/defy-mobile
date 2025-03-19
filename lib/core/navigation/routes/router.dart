import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/home/presentation/screens/home_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_screen.dart';

part 'generated/router.freezed.dart';
part 'generated/router.g.dart';
part 'home_route.dart';
part 'onboarding_route.dart';

@freezed
class AppRoute with _$AppRoute {
  const factory AppRoute.public({
    required Widget Function(BuildContext, GoRouterState) builder,
    String? redirectIfAuthenticated,
  }) = PublicRoute;
  const factory AppRoute.protected({
    required Widget Function(BuildContext, GoRouterState) builder,
  }) = ProtectedRoute;
}

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) => GoRouter(
      initialLocation: const OnboardingRoute().location,
      routes: $appRoutes,
      redirectLimit: 0,
      errorBuilder: (BuildContext context, GoRouterState state) =>
          const Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      ),
    );
