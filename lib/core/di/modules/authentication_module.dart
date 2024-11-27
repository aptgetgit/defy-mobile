import 'package:defy/core/di/providers/services/credential_manager_service_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:credential_manager/credential_manager.dart';
import 'package:defy/config/environment/env.dart';

class AuthenticationModule {
  static Future<List<Override>> initialize() async {
    final overrides = <Override>[];

    final credentialManager = CredentialManager();
    if (credentialManager.isSupportedPlatform) {
      await credentialManager.init(
        preferImmediatelyAvailableCredentials: true,
        googleClientId: Env.googleWebApplicationClientId,
      );
      overrides.add(
        credentialManagerInitializerProvider.overrideWithValue(
          credentialManager,
        ),
      );
    }

    return overrides;
  }
}
