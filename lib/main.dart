import 'dart:async';
import 'package:credential_manager/credential_manager.dart';
import 'package:defy/app.dart';
import 'package:defy/config/env.dart';
import 'package:defy/config/objectbox/objectbox.g.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/core/logging/riverpod_observer.dart';
import 'package:defy/core/providers/dio_provider.dart';
import 'package:defy/core/providers/object_box_database_provider.dart';
import 'package:defy/core/providers/ory_kratos_provider.dart';
import 'package:defy/core/providers/shared_preferences_provider.dart';
import 'package:defy/core/providers/secure_storage_provider.dart';
import 'package:defy/core/providers/credential_manager_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path/path.dart';

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

    final overrides = <Override>[];

    final sharedPreferences = await SharedPreferences.getInstance();

    // Initialize FlutterSecureStorage
    final secureStorage = FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
        preferencesKeyPrefix: 'id.avex.defy.securestorage',
        resetOnError: true,
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
        accountName: 'id.avex.defy.keychain',
        synchronizable: false,
      ),
    );

    final applicationDirectory = await getApplicationDocumentsDirectory();
    final store =
        await openStore(directory: join(applicationDirectory.path, "obx-defy"));

    if (Platform.isAndroid) {
      final credentialManager = CredentialManager();
      await credentialManager.init(
          preferImmediatelyAvailableCredentials: true,
          googleClientId: Env.googleWebApplicationClientId);
      overrides.add(
        credentialManagerInitializerProvider.overrideWithValue(
          credentialManager,
        ),
      );
    }

    overrides.addAll([
      sharedPreferencesInitializerProvider.overrideWithValue(sharedPreferences),
      secureStorageInitializerProvider.overrideWithValue(secureStorage),
      objectBoxDbInitializerProvider.overrideWithValue(store)
    ]);

    final container = ProviderContainer(
      overrides: overrides,
      observers: [
        ProviderLogger(
            logAdditions: true,
            logDisposals: true,
            logErrors: true,
            logUpdates: true,
            logOnlySignificantUpdates: true,
            maxCollectionLogLength: 5,
            updateFrequencyThreshold: Duration(milliseconds: 500),
            logger: AppLogger().logger
            // logger: (String message) {
            //   if (message.startsWith('Provider Error:')) {
            //     AppLogger.error(message);
            //   } else {
            //     AppLogger.debug(message);
            //   }
            // },
            ),
      ],
    );
    container.read(dioInitializerProvider(Env.apiBaseUrl));
    container.read(dioInitializerProvider(Env.oryKratosEndpoint));
    container.read(oryKratosClientInitializerProvider);

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
