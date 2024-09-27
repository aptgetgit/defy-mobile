import 'package:credential_manager/credential_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/credential_manager_provider.g.dart';

@Riverpod(keepAlive: true)
CredentialManager credentialManagerInitializer(
    CredentialManagerInitializerRef ref) {
  throw UnimplementedError('Unimplemented credentialManagerInitializer');
}

@Riverpod(keepAlive: true)
CredentialManagerService credentialManagerService(
    CredentialManagerServiceRef ref) {
  final credentialManager = ref.watch(credentialManagerInitializerProvider);
  return CredentialManagerService(credentialManager);
}

class CredentialManagerService {
  final CredentialManager _credentialManager;

  CredentialManagerService(this._credentialManager);

  CredentialManager get credentialManager => _credentialManager;
}
