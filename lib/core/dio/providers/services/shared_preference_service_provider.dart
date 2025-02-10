import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/shared_preference_service.dart';

part 'generated/shared_preference_service_provider.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferencesInitializer(Ref ref) {
  throw UnimplementedError('Unimplemented sharedPreferencesInitializer');
}

@Riverpod(keepAlive: true)
SharedPreferencesService sharedPreferencesService(Ref ref) {
  final SharedPreferences sharedPreferences =
      ref.watch(sharedPreferencesInitializerProvider);
  return SharedPreferencesService(sharedPreferences);
}
