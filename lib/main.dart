import 'dart:async';
import 'package:defy/app.dart';
import 'package:defy/core/providers/shared_preferences_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void logError(String message, dynamic error, StackTrace? stackTrace) {
  debugPrint('ERROR: $message');
  debugPrint('Error details: $error');
  if (stackTrace != null) {
    debugPrint('Stack trace:\n$stackTrace');
  }
}

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    FlutterError.onError = (FlutterErrorDetails details) {
      logError('Flutter error', details.exception, details.stack);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      logError('Platform error', error, stack);
      return true;
    };

    final sharedPreferences = await SharedPreferences.getInstance();

    final container = ProviderContainer(
      overrides: [
        sharedPreferencesInitializerProvider
            .overrideWithValue(sharedPreferences),
      ],
      observers: [
        _ProviderLogger(),
      ],
    );

    runApp(
      UncontrolledProviderScope(
        container: container,
        child: const DefyApp(),
      ),
    );
  }, (error, stackTrace) {
    logError('Uncaught asynchronous error', error, stackTrace);
  });
}

class _ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }

  @override
  void providerDidFail(ProviderBase provider, Object error,
      StackTrace stackTrace, ProviderContainer container) {
    logError('Provider ${provider.name ?? provider.runtimeType} failed', error,
        stackTrace);
  }
}
