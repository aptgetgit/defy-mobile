import 'package:defy/app/app.dart';
import 'package:defy/app/bootstrap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  await bootstrap(
    builder: (container) => UncontrolledProviderScope(
      container: container,
      child: const DefyApp(),
    ),
  );
}
