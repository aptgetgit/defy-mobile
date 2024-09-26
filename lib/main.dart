import 'dart:async';
import 'package:defy/app.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/core/logging/riverpod_observer.dart';
import 'package:defy/core/providers/shared_preferences_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

void logError(String message, dynamic error, StackTrace? stackTrace) {
  debugPrint('ERROR: $message');
  debugPrint('Error details: $error');
  if (stackTrace != null) {
    debugPrint('Stack trace:\n$stackTrace');
  }
}

Future<void> main() async {
  // Initialize the AppLogger
  AppLogger.init(
    logLevel: Level.debug,
    useColors: true,
    printEmojis: true,
    dateTimeFormatter: DateTimeFormat.onlyTimeAndSinceStart,
  );

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Set up Flutter error handling
    FlutterError.onError = (FlutterErrorDetails details) {
      AppLogger.error('Flutter error',
          error: details.exception, stackTrace: details.stack);
    };

    // Set up platform dispatcher error handling
    PlatformDispatcher.instance.onError = (error, stack) {
      AppLogger.error('Platform error', error: error, stackTrace: stack);
      return true;
    };

    final sharedPreferences = await SharedPreferences.getInstance();

    final container = ProviderContainer(
      overrides: [
        sharedPreferencesInitializerProvider
            .overrideWithValue(sharedPreferences),
      ],
      observers: [
        ProviderLogger(
            logAdditions: true,
            logDisposals: true,
            logErrors: true,
            logUpdates: true,
            logOnlySignificantUpdates: true,
            maxCollectionLogLength: 5,
            updateFrequencyThreshold: Duration(milliseconds: 500),
            logger: (String message) {
              // Use AppLogger here
              if (message.startsWith('Provider Error:')) {
                AppLogger.error(message);
              } else {
                AppLogger.debug(message);
              }
            }),
      ],
    );

    runApp(
      UncontrolledProviderScope(
        container: container,
        child: const DefyApp(),
      ),
    );
  }, (error, stackTrace) {
    AppLogger.fatal('Uncaught asynchronous error',
        error: error, stackTrace: stackTrace);
  });
}
