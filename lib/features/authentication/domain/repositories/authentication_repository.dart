import 'package:freezed_annotation/freezed_annotation.dart';
import '../entities/session_entity.dart';

part 'generated/authentication_repository.freezed.dart';

@freezed
class InitiateSignUpOptions with _$InitiateSignUpOptions {
  const factory InitiateSignUpOptions.withEmailCode({
    required String email,
    required String username,
    required String name,
  }) = InitiateSignUpOptionsWithEmailCode;

  const factory InitiateSignUpOptions.withOIDC({
    required String username,
    required String name,
  }) = InitiateSignUpOptionsWithOIDC;
}

@freezed
class CompleteSignUpOptions with _$CompleteSignUpOptions {
  const factory CompleteSignUpOptions.withEmailCode({
    required String flowId,
    required String username,
    required String name,
    required String email,
    required String code,
  }) = CompleteSignUpOptionsWithEmailCode;

  const factory CompleteSignUpOptions.withOIDC({
    required String flowId,
    required String username,
    required String name,
    required String email,
    required String provider,
    required String idToken,
  }) = CompleteSignUpOptionsWithOIDC;
}

@freezed
class InitiateSignInOptions with _$InitiateSignInOptions {
  const factory InitiateSignInOptions.withEmailCode({
    required String email,
  }) = InitiateSignInOptionsWithEmailCode;

  const factory InitiateSignInOptions.withOIDC() = InitiateSignInOptionsWithOIDC;
}

@freezed
class CompleteSignInOptions with _$CompleteSignInOptions {
  const factory CompleteSignInOptions.withEmailCode({
    required String flowId,
    required String identifier,
    required String code,
  }) = CompleteSignInOptionsWithEmailCode;

  const factory CompleteSignInOptions.withOIDC({
    required String flowId,
    required String provider,
    required String idToken,
  }) = CompleteSignInOptionsWithOIDC;
}

abstract class AuthenticationRepository {
  Future<String> initiateSignUp(InitiateSignUpOptions options);
  Future<String> initiateSignIn(InitiateSignInOptions options);
  Future<SessionEntity> completeSignUp(CompleteSignUpOptions options);
  Future<SessionEntity> completeSignIn(CompleteSignInOptions options);
  Future<void> signOut(String identityId);
  Future<List<IdentityEntity>> getLoggedInIdentities();
  Future<String> getSessionToken(String identityId);
  Future<void> saveSessionToken(String identityId, String token);
  Future<void> deleteSessionToken(String identityId);
  Future<void> setActiveIdentity(String identityId);
  String? getActiveIdentity();
}