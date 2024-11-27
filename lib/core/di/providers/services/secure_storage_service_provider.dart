import 'package:defy/core/services/secure_storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/secure_storage_service_provider.g.dart';

@Riverpod(keepAlive: true)
FlutterSecureStorage secureStorageInitializer(Ref ref) {
  throw UnimplementedError(
      'The secure storage initializer must be implemented in the platform-specific code');
}

@Riverpod(keepAlive: true)
SecureStorageService secureStorageService(Ref ref) {
  final secureStorage = ref.watch(secureStorageInitializerProvider);
  return SecureStorageService(secureStorage);
}
