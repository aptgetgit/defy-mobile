import 'package:defy/core/logging/app_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:defy/core/di/modules/storage_module.dart';
import 'package:defy/core/di/modules/network_module.dart';
import 'package:defy/core/di/modules/authentication_module.dart';
import 'package:defy/core/logging/riverpod_observer.dart';

class DependencyInjector {
  static Future<ProviderContainer> initializeApp() async {
    final overrides = <Override>[];

    // Initialize all modules
    overrides.addAll(await StorageModule.initialize());
    overrides.addAll(await NetworkModule.initialize());
    overrides.addAll(await AuthenticationModule.initialize());

    return ProviderContainer(
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
          logger: AppLogger().logger,
        ),
      ],
    );
  }
}
