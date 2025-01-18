import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../logging/app_logger.dart';
import '../logging/riverpod_observer.dart';
import 'modules/network_module.dart';
import 'modules/storage_module.dart';

Future<ProviderContainer> initializeApp() async {
  final List<Override> overrides = <Override>[
    ...await initializeStorageModule(),
    ...await initializeNetworkModule(),
  ];

  return ProviderContainer(
    overrides: overrides,
    observers: <ProviderObserver>[
      ProviderLogger(
        logger: AppLogger().logger,
      ),
    ],
  );
}
