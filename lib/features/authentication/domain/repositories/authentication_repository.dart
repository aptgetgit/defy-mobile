import 'package:credential_manager/credential_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../entities/session_entity.dart';

part 'generated/authentication_repository.freezed.dart';

@freezed
class InitiateRegistrationOptions with _$InitiateRegistrationOptions {
  const factory InitiateRegistrationOptions.withEmailCode({
    required String email,
    required String username,
    required String name,
  }) = InitiateRegistrationOptionsWithEmailCode;

  const factory InitiateRegistrationOptions.withOIDC({
    required String username,
    required String name,
  }) = InitiateRegistrationOptionsWithOIDC;
}

@freezed
class CompleteRegistrationOptions with _$CompleteRegistrationOptions {
  const factory CompleteRegistrationOptions.withEmailCode({
    required String flowId,
    required String username,
    required String name,
    required String email,
    required String code,
  }) = CompleteRegistrationOptionsWithEmailCode;

  const factory CompleteRegistrationOptions.withOIDC({
    required String flowId,
    required String username,
    required String name,
    required String email,
    required String provider,
    required String idToken,
  }) = CompleteRegistrationOptionsWithOIDC;
}

@freezed
class InitiateLoginOptions with _$InitiateLoginOptions {
  const factory InitiateLoginOptions.withEmailCode({
    required String email,
  }) = InitiateLoginOptionsWithEmailCode;

  const factory InitiateLoginOptions.withOIDC() = InitiateLoginOptionsWithOIDC;
}

@freezed
class CompleteLoginOptions with _$CompleteLoginOptions {
  const factory CompleteLoginOptions.withEmailCode({
    required String flowId,
    required String identifier,
    required String code,
  }) = CompleteLoginOptionsWithEmailCode;

  const factory CompleteLoginOptions.withOIDC({
    required String flowId,
    required String provider,
    required String idToken,
  }) = CompleteLoginOptionsWithOIDC;
}

abstract class AuthenticationRepository {
  Future<GoogleIdTokenCredential> signInWithGoogle();

  Future<String> initiateRegistration(InitiateRegistrationOptions options);
  Future<String> initiateLogin(InitiateLoginOptions options);
  Future<SessionEntity> completeRegistration(
      CompleteRegistrationOptions options);
  Future<SessionEntity> completeLogin(CompleteLoginOptions options);
  Future<void> logout(String identityId);

  Future<List<IdentityEntity>> getLoggedInIdentities();
  Future<String> getSessionToken(String identityId);
  Future<void> saveSessionToken(String identityId, String token);
  Future<void> deleteSessionToken(String identityId);

  Future<SessionEntity> getSessionDetails(String identityId);
  Future<void> saveSessionDetails(SessionEntity session);
  Future<void> deleteSessionDetails(String identityId);

  Future<void> setActiveIdentity(String identityId);
  Future<void> deleteActiveIdentity();
  String? getActiveIdentity();

  Future<SessionEntity> getCurrentSession(String sessionToken);
}
