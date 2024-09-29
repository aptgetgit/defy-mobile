import 'dart:convert';

import 'package:built_value/json_object.dart';
import 'package:credential_manager/credential_manager.dart';
import 'package:defy/core/providers/credential_manager_provider.dart';
import 'package:defy/core/providers/secure_storage_provider.dart';
import 'package:defy/core/providers/shared_preferences_provider.dart';
import 'package:defy/features/authentication/data/source/remote/kratos_data_source.dart';
import 'package:defy/features/authentication/domain/entities/session_entity.dart';
import 'package:defy/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:ory_kratos_client/ory_kratos_client.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  static const String _prefix = 'authentication:identity:';

  static String sessionTokenKey(String identityId) =>
      '$_prefix$identityId:session:token';

  static String sessionDetailsKey(String identityId) =>
      '$_prefix$identityId:session:details';

  static String activeIdentityKey() => '${_prefix}active';

  final KratosDataSource _kratosClient;
  final CredentialManagerService _credentialManager;
  final SecureStorageService _secureStorage;
  final SharedPreferencesService _sharedPref;

  AuthenticationRepositoryImpl(this._kratosClient, this._credentialManager,
      this._secureStorage, this._sharedPref);

  Future<GoogleIdTokenCredential> signInWithGoogle() async {
    if (!_credentialManager.isSupportedPlatform) {
      throw UnsupportedError('Google Sign-In is not supported on this platform');
    }
    final credential = await _credentialManager.saveGoogleCredential();
    if (credential == null) {
      throw StateError('Failed to obtain Google credentials');
    }
    return credential;
  }

  @override
  Future<String> initiateSignUp(InitiateSignUpOptions options) async {
    return options.when(
      withEmailCode: (email, username, name) => _initiateSignUpWithEmail(email),
      withOIDC: (username, name) => _initiateSignUpWithOIDC(),
    );
  }

  @override
  Future<String> initiateSignIn(InitiateSignInOptions options) async {
    return options.when(
      withEmailCode: (email) async {
        final flowId = await _initiateSignInWithEmail();
        await _requestCodeForSignInWithEmail(flowId, email);
        return flowId;
      },
      withOIDC: () => _initiateSignInWithOIDC(),
    );
  }

  @override
  Future<SessionEntity> completeSignUp(CompleteSignUpOptions options) async {
    return options.when(
      withEmailCode: (flowId, username, name, email, code) => 
          _completeSignUpWithEmail(flowId, username, name, email, code),
      withOIDC: (flowId, username, name, email, provider, idToken) => 
          _completeSignUpWithOIDC(flowId, username, name, email, provider, idToken),
    );
  }

  @override
  Future<SessionEntity> completeSignIn(CompleteSignInOptions options) async {
    return options.when(
      withEmailCode: (flowId, identifier, code) => 
          _completeSignInWithEmail(flowId, identifier, code),
      withOIDC: (flowId, provider, idToken) => 
          _completeSignInWithOIDC(flowId, provider, idToken),
    );
  }

  @override
  Future<void> signOut(String identityId) async {
    final activeIdentity = _getActiveIdentity();
    await _deleteSessionToken(identityId);
    await _deleteSessionDetails(identityId);
    if (activeIdentity == identityId) {
      await _deleteActiveIdentity();
    }
  }

  @override
  Future<String> getSessionToken(String identityId) async {
    final token = await _getSessionToken(identityId);
    if (token == null) {
      throw StateError('Session token not found');
    }
    return token;
  }

  @override
  Future<void> saveSessionToken(String identityId, String token) async {
    await _saveSessionToken(identityId, token);
  }

  @override
  Future<void> deleteSessionToken(String identityId) async {
    await _deleteSessionToken(identityId);
  }

  @override
  Future<void> setActiveIdentity(String identityId) async {
    await _setActiveIdentity(identityId);
  }

  @override
  String? getActiveIdentity() {
    return _getActiveIdentity();
  }

  Future<String> _initiateSignUpWithEmail(String email) async {
    final flow = await _kratosClient.createNativeRegistrationFlow(
        KratosCreateNativeRegistrationFlowOptions.withCode());
    return flow.id;
  }

  Future<void> _requestCodeForSignInWithEmail(String flowId, String email) async {
    await _kratosClient
        .updateNativeLoginFlow(KratosUpdateNativeLoginFlowOptions.withCode(
      flowId: flowId,
      identifier: email,
    ));
  }

  Future<String> _initiateSignUpWithOIDC() async {
    final flow = await _kratosClient.createNativeRegistrationFlow(
        KratosCreateNativeRegistrationFlowOptions.withOIDC());
    return flow.id;
  }

  Future<String> _initiateSignInWithEmail() async {
    final flow = await _kratosClient
        .createNativeLoginFlow(KratosCreateNativeLoginFlowOptions.withCode());
    return flow.id;
  }

  Future<String> _initiateSignInWithOIDC() async {
    final flow = await _kratosClient
        .createNativeLoginFlow(KratosCreateNativeLoginFlowOptions.withOIDC());
    return flow.id;
  }

  Future<SessionEntity> _completeSignUpWithEmail(
      String flowId, String username, String name, String email, String code) async {
    final traits = JsonObject({
      "email": email,
      "username": username,
      "name": name
    });
    final response = await _kratosClient.updateNativeRegistrationFlow(
      KratosUpdateNativeRegistrationFlowOptions.withCode(
          flowId: flowId, traits: traits, code: code),
    );
    if (response == null || response.session == null || response.sessionToken == null) {
      throw StateError('Invalid response from registration flow');
    }
    final sessionEntity = _mapToSessionEntity(response.session!);
    await _saveSessionToken(sessionEntity.identity.id, response.sessionToken!);
    await _saveSessionDetails(sessionEntity.identity.id, sessionEntity);
    return sessionEntity;
  }

  Future<SessionEntity> _completeSignUpWithOIDC(
      String flowId, String username, String name, String email, String provider, String idToken) async {
    final traits = JsonObject({
      "email": email,
      "username": username,
      "name": name
    });
    final response = await _kratosClient.updateNativeRegistrationFlow(
      KratosUpdateNativeRegistrationFlowOptions.withOIDC(
          flowId: flowId,
          traits: traits,
          provider: provider,
          idToken: idToken),
    );
    if (response == null || response.session == null || response.sessionToken == null) {
      throw StateError('Invalid response from registration flow');
    }
    final sessionEntity = _mapToSessionEntity(response.session!);
    await _saveSessionToken(sessionEntity.identity.id, response.sessionToken!);
    await _saveSessionDetails(sessionEntity.identity.id, sessionEntity);
    return sessionEntity;
  }

  Future<SessionEntity> _completeSignInWithEmail(
      String flowId, String identifier, String code) async {
    final response = await _kratosClient.updateNativeLoginFlow(
      KratosUpdateNativeLoginFlowOptions.withCode(
          flowId: flowId,
          identifier: identifier,
          code: code),
    );
    if (response == null || response.sessionToken == null) {
      throw StateError('Invalid response from login flow');
    }
    final sessionEntity = _mapToSessionEntity(response.session);
    await _saveSessionToken(sessionEntity.identity.id, response.sessionToken!);
    await _saveSessionDetails(sessionEntity.identity.id, sessionEntity);
    return sessionEntity;
  }

  Future<SessionEntity> _completeSignInWithOIDC(
      String flowId, String provider, String idToken) async {
    final response = await _kratosClient.updateNativeLoginFlow(
      KratosUpdateNativeLoginFlowOptions.withOIDC(
          flowId: flowId,
          provider: provider,
          idToken: idToken),
    );
    if (response == null || response.sessionToken == null) {
      throw StateError('Invalid response from login flow');
    }
    final sessionEntity = _mapToSessionEntity(response.session);
    await _saveSessionToken(sessionEntity.identity.id, response.sessionToken!);
    await _saveSessionDetails(sessionEntity.identity.id, sessionEntity);
    return sessionEntity;
  }

  Future<void> _saveSessionToken(String identityId, String token) async {
    await _secureStorage.write(sessionTokenKey(identityId), token);
  }

  Future<String?> _getSessionToken(String identityId) async {
    return await _secureStorage.read(sessionTokenKey(identityId));
  }

  Future<void> _deleteSessionToken(String identityId) async {
    await _secureStorage.delete(sessionTokenKey(identityId));
  }

  Future<void> _setActiveIdentity(String identityId) async {
    await _sharedPref.set<String>(activeIdentityKey(), identityId);
  }

  String? _getActiveIdentity() {
    return _sharedPref.get<String>(activeIdentityKey());
  }

  Future<void> _deleteActiveIdentity() async {
    await _sharedPref.remove(activeIdentityKey());
  }

  @override
  Future<List<IdentityEntity>> getLoggedInIdentities() async {
    final allKeys = _sharedPref.getKeys();
    final sessionKeys = allKeys.where(
        (key) => key.startsWith(_prefix) && key.endsWith(':session:details'));

    final List<IdentityEntity> identities = [];
    for (final key in sessionKeys) {
      final identityId = key.split(':')[2];
      final sessionDetailsJson = _getSessionDetails(identityId);
      if (sessionDetailsJson != null) {
        final hasToken =
            await _secureStorage.containsKey(sessionTokenKey(identityId));
        final isExpired = sessionDetailsJson.isExpired;

        if (hasToken && !isExpired) {
          identities.add(IdentityEntity(
              id: sessionDetailsJson.identity.id,
              createdAt: sessionDetailsJson.identity.createdAt,
              updatedAt: sessionDetailsJson.identity.updatedAt));
        } else {
          await _deleteSessionDetails(identityId);
        }
      }
    }
    return identities;
  }

  Future<void> _saveSessionDetails(
      String identityId, SessionEntity session) async {
    await _sharedPref.set<String>(
        sessionDetailsKey(identityId), jsonEncode(session.toJson()));
  }

  SessionEntity? _getSessionDetails(String identityId) {
    final sessionDetails =
        _sharedPref.get<String>(sessionDetailsKey(identityId));
    if (sessionDetails != null) {
      Map<String, dynamic> sessionMap = jsonDecode(sessionDetails);
      return SessionEntity.fromJson(sessionMap);
    }
    return null;
  }

  Future<void> _deleteSessionDetails(String identityId) async {
    await _sharedPref.remove(sessionDetailsKey(identityId));
  }

  SessionEntity _mapToSessionEntity(Session session) {
    if (session.identity == null) {
      throw StateError('Invalid session: identity is null');
    }
    return SessionEntity(
      id: session.id,
      identity: IdentityEntity(
          id: session.identity!.id,
          createdAt: session.identity!.createdAt ?? DateTime.now(),
          updatedAt: session.identity!.updatedAt ?? DateTime.now()),
      authenticatedAt: session.authenticatedAt ?? DateTime.now(),
      expiresAt: session.expiresAt ?? DateTime.now().add(const Duration(hours: 1)),
      issuedAt: session.issuedAt ?? DateTime.now(),
      authenticatorAssuranceLevel: AssuranceLevel.fromString(
          session.authenticatorAssuranceLevel.toString()),
    );
  }
}