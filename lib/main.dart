import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/app.dart';
import 'app/bootstrap.dart';

Future<void> main() async {
  await bootstrap(
    builder: (ProviderContainer container) => UncontrolledProviderScope(
      container: container,
      child: const DefyApp(),
    ),
  );
}
