import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'generated/shared_preferences_provider.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferencesAsync> sharedPreferences(Ref ref) async =>
    SharedPreferencesAsync();
