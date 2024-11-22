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

  Future<Credentials> getCredentials() {
    return _credentialManager.getCredentials(
        fetchOptions: FetchOptionsAndroid(
            googleCredential: true, passKey: false, passwordCredential: false));
  }

  /// Saves Google credential
  Future<GoogleIdTokenCredential?> saveGoogleCredential(
      {bool useButtonFlow = false}) {
    return _credentialManager.saveGoogleCredential(
        useButtonFlow: useButtonFlow);
  }

  /// Logs out the user and clears credentials
  Future<void> logout() {
    return _credentialManager.logout();
  }

  /// Checks if the Credential Manager is supported on the current platform
  bool get isSupportedPlatform => _credentialManager.isSupportedPlatform;
}
