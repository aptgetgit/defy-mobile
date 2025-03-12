// lib/app/bootstrap.dart
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../core/logging/app_logger.dart';

Future<void> bootstrap({
  required Widget Function() builder,
}) async {
  AppLogger.init();

  return runZonedGuarded(() {
    final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    _setupErrorHandling();
    
    FlutterNativeSplash.remove();
    runApp(builder());
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
