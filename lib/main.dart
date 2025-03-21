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

Future<void> main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Lock the app to portrait mode only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  await bootstrap(
    builder: (ProviderContainer container) => UncontrolledProviderScope(
      container: container,
      child: const DefyApp(),
    ),
  );
}