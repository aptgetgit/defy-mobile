import 'dart:async';
import 'package:defy/core/di/dependency_injector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:logger/logger.dart';

Future<void> bootstrap({
  required Widget Function(ProviderContainer container) builder,
}) async {
  AppLogger.init(
    logLevel: Level.debug,
    useColors: true,
    printEmojis: true,
    dateTimeFormatter: DateTimeFormat.onlyTimeAndSinceStart,
  );

  return runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    _setupErrorHandling();

    final container = await DependencyInjector.initializeApp();

    runApp(builder(container));
  }, (error, stackTrace) {
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

  PlatformDispatcher.instance.onError = (error, stack) {
    AppLogger.error('Platform error', error: error, stackTrace: stack);
    return true;
  };
}
