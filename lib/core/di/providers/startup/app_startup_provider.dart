import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/connectivity/presentation/providers/connectivity_status_provider.dart';
import '../locale/locale_provider.dart';
import '../services/secure_storage_service_provider.dart';
import '../services/shared_preferences_service_provider.dart';
import '../storage/object_box_store_provider.dart';
import '../theme/theme_provider.dart';

part 'generated/app_startup_provider.g.dart';

// @Riverpod(keepAlive: true)
// Future<void> appStartup(Ref ref) async {
//   ref.onDispose(() {
//     ref
//       ..invalidate(secureStorageServiceProvider)
//       ..invalidate(sharedPreferencesServiceProvider)
//       ..invalidate(objectBoxStoreProvider)
//       ..invalidate(localeNotifierProvider)
//       ..invalidate(themeNotifierProvider);
//   });

//   await Future.wait<void>(<Future<void>>[
//     ref.read(sharedPreferencesServiceProvider.future),
//     ref.read(objectBoxStoreProvider.future),
//   ]);

//   ref.read(secureStorageServiceProvider);

//   await Future.wait<void>(<Future<void>>[
//     ref.read(localeNotifierProvider.future),
//     ref.read(themeNotifierProvider.future),
//   ]);

//   ref
//     ..read(connectivityStatusInitializerProvider)
//     ..read(networkConfigSyncProvider);
//   return;
// }

@Riverpod(keepAlive: true)
class AppStartupNotifier extends _$AppStartupNotifier {
  @override
  Future<void> build() async {
    ref.onDispose(() {
      ref
        ..invalidate(secureStorageServiceProvider)
        ..invalidate(sharedPreferencesServiceProvider)
        ..invalidate(objectBoxStoreProvider)
        ..invalidate(localeNotifierProvider)
        ..invalidate(themeNotifierProvider);
    });

    await _initializeServices();
  }

  Future<void> _initializeServices() async {
    await Future.wait<void>(<Future<void>>[
      ref.read(sharedPreferencesServiceProvider.future),
      ref.read(objectBoxStoreProvider.future),
    ]);

    ref.read(secureStorageServiceProvider);

    await Future.wait<void>(<Future<void>>[
      ref.read(localeNotifierProvider.future),
      ref.read(themeNotifierProvider.future),
    ]);

    ref.read(connectivityStatusProvider);
    // ..read(networkConfigSyncProvider);
  }

  Future<void> retry() async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard(_initializeServices);
  }
}
