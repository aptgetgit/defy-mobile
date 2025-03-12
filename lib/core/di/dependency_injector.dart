import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../logging/app_logger.dart';
import '../logging/riverpod_observer.dart';

Future<ProviderContainer> initializeApp() async => ProviderContainer(
      observers: <ProviderObserver>[
        ProviderLogger(
          logger: AppLogger().logger,
        ),
      ],
    );
