import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/shared_preference_service.dart';
import '../storage/shared_preferences_provider.dart';

part 'generated/shared_preferences_service_provider.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferencesService> sharedPreferencesService(Ref ref) async =>
    SharedPreferencesService(await ref.watch(sharedPreferencesProvider.future));
