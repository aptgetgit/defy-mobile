import 'package:credential_manager/credential_manager.dart';
import 'package:defy/core/services/credential_manager_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/credential_manager_service_provider.g.dart';

@Riverpod(keepAlive: true)
CredentialManager credentialManagerInitializer(Ref ref) {
  throw UnimplementedError('Unimplemented credentialManagerInitializer');
}

@Riverpod(keepAlive: true)
CredentialManagerService credentialManagerService(Ref ref) {
  final credentialManager = ref.watch(credentialManagerInitializerProvider);
  return CredentialManagerService(credentialManager);
}
