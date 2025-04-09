import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/app.dart';
import 'app/bootstrap.dart';
import 'core/logging/app_logger.dart';
import 'core/logging/riverpod_observer.dart';

Future<void> main() async {
  await bootstrap(
    appBuilder: () => ProviderScope(
      observers: <ProviderObserver>[
        ProviderLogger(
          logger: AppLogger().logger,
        ),
      ],
      child: const DefyApp(),
    ),
  );
}
