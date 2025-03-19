// lib/app/bootstrap.dart
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../core/logging/app_logger.dart';

Future<void> bootstrap({required Widget Function() appBuilder}) {
  AppLogger.init();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    AppLogger.error(
      'Flutter error',
      error: details.exception,
      stackTrace: details.stack,
    );
  };

  // // Handle errors that occur in isolates
  // Isolate.current.addErrorListener(RawReceivePort((pair) {
  //   final List<dynamic> errorAndStacktrace = pair;
  //   final String error = errorAndStacktrace[0];
  //   final StackTrace stackTrace = errorAndStacktrace[1];
  //   AppLogger.error('Isolate error: $error', stackTrace: stackTrace);
  // }).sendPort);

  // Handle errors not caught by the Flutter framework
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    AppLogger.error('Platform error', error: error, stackTrace: stack);
    return true; // Return true to indicate the error was handled
  };

  return SentryFlutter.init(
    (SentryFlutterOptions options) {
      options
        ..dsn =
            'https://0dc8b2be00f7f48577dc8ca6d5c6c82c@o4508964799971328.ingest.us.sentry.io/4508964802396160'
        ..environment = kReleaseMode ? 'production' : 'development'
        ..tracesSampleRate = 0.0
        ..attachStacktrace = true
        ..sendDefaultPii = true
        ..debug = false
        ..beforeSend = (SentryEvent event, Hint? hint) {
          AppLogger.info('Sending event to Sentry: ${event.eventId}');
          AppLogger.info(
            'Error being sent to Sentry: ${event.exceptions}',
            stackTrace:
                event.throwable is Error
                    ? (event.throwable as Error).stackTrace
                    : null,
          );
          return event;
        };
    },
    appRunner: () {
      final WidgetsBinding widgetsBinding =
          WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      FlutterNativeSplash.remove();
      return runApp(appBuilder());
    },
  );
}
