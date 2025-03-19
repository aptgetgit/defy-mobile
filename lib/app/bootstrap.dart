// lib/app/bootstrap.dart
import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:logger/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../config/environment/env.dart';
import '../core/logging/app_logger.dart';

RawReceivePort? _isolateErrorPort;

Future<void> bootstrap({required Widget Function() appBuilder}) {
  AppLogger.init(logLevel: kDebugMode ? Level.debug : Level.error);

  setupFlutterErrorHandler();
  setupIsolateErrorListener();
  setupPlatformErrorHandler();

  return SentryFlutter.init(
    configureSentryOptions,
    appRunner: () {
      final WidgetsBinding widgetsBinding =
          WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      FlutterNativeSplash.remove();
      // ignore: missing_provider_scope
      return runApp(appBuilder());
    },
  );
}

void setupFlutterErrorHandler() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    AppLogger.error(
      'Flutter error',
      error: details.exception,
      stackTrace: details.stack,
    );
  };
}

void setupIsolateErrorListener() {
  _isolateErrorPort?.close();

  final RawReceivePort errorPort = RawReceivePort((dynamic pair) {
    if (pair is List && pair.length == 2) {
      final dynamic error = pair[0];
      final StackTrace stackTrace =
          pair[1] is StackTrace
              ? pair[1] as StackTrace
              : StackTrace.fromString(pair[1].toString());

      AppLogger.error('Isolate error', error: error, stackTrace: stackTrace);
    } else {
      AppLogger.error('Unexpected isolate error format: $pair');
    }
  });

  _isolateErrorPort = errorPort;

  Isolate.current.addErrorListener(errorPort.sendPort);
}

void disposeIsolateErrorListener() {
  _isolateErrorPort?.close();
  _isolateErrorPort = null;
}

void setupPlatformErrorHandler() {
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    AppLogger.error('Platform error', error: error, stackTrace: stack);
    return true;
  };
}

void configureSentryOptions(SentryFlutterOptions options) {
  options
    ..dsn = Env.sentryDsn
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
}
