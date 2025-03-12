import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/app.dart';
import 'app/bootstrap.dart';
import 'core/logging/app_logger.dart';
import 'core/logging/riverpod_observer.dart';

void main() {
  bootstrap(
    builder: () => ProviderScope(
      observers: <ProviderObserver>[
        ProviderLogger(
          logger: AppLogger().logger,
        ),
      ],
      child: const DefyApp(),
    ),
  );
}
