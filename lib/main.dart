// import 'package:hooks_riverpod/hooks_riverpod.dart';


// import 'app/app.dart';
// import 'app/bootstrap.dart';



// Future<void> main() async {
//   await bootstrap(
//     builder: (ProviderContainer container) => UncontrolledProviderScope(
//       container: container,
//       child: const DefyApp(),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/app.dart';
import 'app/bootstrap.dart';
import 'core/logging/app_logger.dart';
import 'core/logging/riverpod_observer.dart';

Future<void> main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Lock the app to portrait mode only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
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