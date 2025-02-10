import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/dio/dependency_injector.dart';
import '../core/logging/app_logger.dart';

Future<void> bootstrap({
  required Widget Function(ProviderContainer container) builder,
}) async {
  AppLogger.init();

  return runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    _setupErrorHandling();

    final ProviderContainer container = await initializeApp();

    // ignore: missing_provider_scope
    runApp(builder(container));
  }, (Object error, StackTrace stackTrace) {
    AppLogger.fatal(
      'Uncaught asynchronous error',
      error: error,
      stackTrace: stackTrace,
    );
  });
}

void _setupErrorHandling() {
  FlutterError.onError = (FlutterErrorDetails details) {
    AppLogger.error(
      'Flutter error',
      error: details.exception,
      stackTrace: details.stack,
    );
  };

  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    AppLogger.error('Platform error', error: error, stackTrace: stack);
    return true;
  };
}
