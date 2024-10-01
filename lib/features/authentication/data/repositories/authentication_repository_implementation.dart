import 'dart:convert';

import 'package:built_value/json_object.dart';
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
  final SecureStorageService _secureStorage;
  final SharedPreferencesService _sharedPreferences;

  AuthenticationRepositoryImpl(
      this._kratosClient, this._secureStorage, this._sharedPreferences);

  @override
  Future<SessionEntity> getCurrentSession(String sessionToken) async {
    final session = await _kratosClient.getCurrentSession(sessionToken);
    if (session == null) {
      throw StateError('Failed to get current session');
    }
    return _mapToSessionEntity(session);
  }

  @override
  Future<String> initiateRegistration(
      InitiateRegistrationOptions options) async {
    return options.when(
      withEmailCode: (email, username, name) =>
          _initiateRegistrationWithEmail(),
      withOIDC: (username, name) => _initiateRegistrationWithOIDC(),
    );
  }

  @override
  Future<String> initiateLogin(InitiateLoginOptions options) async {
    return options.when(
      withEmailCode: (email) async {
        final flowId = await _initiateLoginWithEmail();
        await _requestCodeForLoginWithEmail(flowId, email);
        return flowId;
      },
      withOIDC: () => _initiateLoginWithOIDC(),
    );
  }

  @override
  Future<SessionEntity> completeRegistration(
      CompleteRegistrationOptions options) async {
    return options.when(
      withEmailCode: (flowId, username, name, email, code) =>
          _completeRegistrationWithEmail(flowId, username, name, email, code),
      withOIDC: (flowId, username, name, provider, idToken) =>
          _completeRegistrationWithOIDC(
              flowId, username, name, provider, idToken),
    );
  }

  @override
  Future<SessionEntity> completeLogin(CompleteLoginOptions options) async {
    return options.when(
      withEmailCode: (flowId, identifier, code) =>
          _completeLoginWithEmail(flowId, identifier, code),
      withOIDC: (flowId, provider, idToken) =>
          _completeLoginWithOIDC(flowId, provider, idToken),
    );
  }

  @override
  Future<void> logout(String identityId) async {
    await _deleteSessionToken(identityId);
    await _deleteSessionDetails(identityId);
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
  Future<SessionEntity> getSessionDetails(String identityId) async {
    final sessionDetails = _getSessionDetails(identityId);
    if (sessionDetails == null) {
      throw StateError('Session details not found');
    }
    return sessionDetails;
  }

  @override
  Future<void> saveSessionDetails(SessionEntity session) async {
    await _saveSessionDetails(session);
  }

  @override
  Future<void> deleteSessionDetails(String identityId) async {
    await _deleteSessionDetails(identityId);
  }

  @override
  Future<void> setActiveIdentity(String identityId) async {
    await _setActiveIdentity(identityId);
  }

  @override
  Future<void> deleteActiveIdentity() async {
    await _deleteActiveIdentity();
  }

  @override
  String? getActiveIdentity() {
    return _getActiveIdentity();
  }

  Future<String> _initiateRegistrationWithEmail() async {
    final flow = await _kratosClient.createNativeRegistrationFlow(
        KratosCreateNativeRegistrationFlowOptions.withCode());
    if (flow == null) {
      throw StateError('Failed to create registration flow');
    }
    return flow.id;
  }

  Future<void> _requestCodeForLoginWithEmail(
      String flowId, String email) async {
    await _kratosClient
        .updateNativeLoginFlow(KratosUpdateNativeLoginFlowOptions.withCode(
      flowId: flowId,
      identifier: email,
    ));
  }

  Future<String> _initiateRegistrationWithOIDC() async {
    final flow = await _kratosClient.createNativeRegistrationFlow(
        KratosCreateNativeRegistrationFlowOptions.withOIDC());
    if (flow == null) {
      throw StateError('Failed to create registration flow');
    }
    return flow.id;
  }

  Future<String> _initiateLoginWithEmail() async {
    final flow = await _kratosClient
        .createNativeLoginFlow(KratosCreateNativeLoginFlowOptions.withCode());
    if (flow == null) {
      throw StateError('Failed to create login flow');
    }
    return flow.id;
  }

  Future<String> _initiateLoginWithOIDC() async {
    final flow = await _kratosClient
        .createNativeLoginFlow(KratosCreateNativeLoginFlowOptions.withOIDC());
    if (flow == null) {
      throw StateError('Failed to create login flow');
    }
    return flow.id;
  }

  Future<SessionEntity> _completeRegistrationWithEmail(String flowId,
      String username, String name, String email, String code) async {
    final traits =
        JsonObject({"email": email, "username": username, "name": name});
    final response = await _kratosClient.updateNativeRegistrationFlow(
      KratosUpdateNativeRegistrationFlowOptions.withCode(
          flowId: flowId, traits: traits, code: code),
    );
    if (response == null ||
        response.session == null ||
        response.sessionToken == null) {
      throw StateError('Invalid response from registration flow');
    }
    final sessionEntity = _mapToSessionEntity(response.session!);
    await _saveSessionToken(sessionEntity.identity.id, response.sessionToken!);
    await _saveSessionDetails(sessionEntity);
    return sessionEntity;
  }

  Future<SessionEntity> _completeRegistrationWithOIDC(
      String flowId,
      String username,
      String name,
      String provider,
      String idToken) async {
    final traits =
        JsonObject({"username": username, "name": name});
    final response = await _kratosClient.updateNativeRegistrationFlow(
      KratosUpdateNativeRegistrationFlowOptions.withOIDC(
          flowId: flowId, traits: traits, provider: provider, idToken: idToken),
    );
    if (response == null ||
        response.session == null ||
        response.sessionToken == null) {
      throw StateError('Invalid response from registration flow');
    }
    final sessionEntity = _mapToSessionEntity(response.session!);
    await _saveSessionToken(sessionEntity.identity.id, response.sessionToken!);
    await _saveSessionDetails(sessionEntity);
    return sessionEntity;
  }

  Future<SessionEntity> _completeLoginWithEmail(
      String flowId, String identifier, String code) async {
    final response = await _kratosClient.updateNativeLoginFlow(
      KratosUpdateNativeLoginFlowOptions.withCode(
          flowId: flowId, identifier: identifier, code: code),
    );
    if (response == null || response.sessionToken == null) {
      throw StateError('Invalid response from login flow');
    }
    final sessionEntity = _mapToSessionEntity(response.session);
    await _saveSessionToken(sessionEntity.identity.id, response.sessionToken!);
    await _saveSessionDetails(sessionEntity);
    return sessionEntity;
  }

  Future<SessionEntity> _completeLoginWithOIDC(
      String flowId, String provider, String idToken) async {
    final response = await _kratosClient.updateNativeLoginFlow(
      KratosUpdateNativeLoginFlowOptions.withOIDC(
          flowId: flowId, provider: provider, idToken: idToken),
    );
    if (response == null || response.sessionToken == null) {
      throw StateError('Invalid response from login flow');
    }
    final sessionEntity = _mapToSessionEntity(response.session);
    await _saveSessionToken(sessionEntity.identity.id, response.sessionToken!);
    await _saveSessionDetails(sessionEntity);
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
    await _sharedPreferences.set<String>(activeIdentityKey(), identityId);
  }

  String? _getActiveIdentity() {
    return _sharedPreferences.get<String>(activeIdentityKey());
  }

  Future<void> _deleteActiveIdentity() async {
    await _sharedPreferences.remove(activeIdentityKey());
  }

  @override
  Future<List<IdentityEntity>> getLoggedInIdentities() async {
    final allKeys = _sharedPreferences.getKeys();
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
        final isActive = sessionDetailsJson.isActive;
        if (hasToken && !isExpired && isActive) {
          identities.add(IdentityEntity(
              id: sessionDetailsJson.identity.id,
              createdAt: sessionDetailsJson.identity.createdAt,
              updatedAt: sessionDetailsJson.identity.updatedAt));
        } else {
          await _deleteSessionDetails(identityId);
          await _deleteSessionToken(identityId);
        }
      }
    }
    return identities;
  }

  Future<void> _saveSessionDetails(SessionEntity session) async {
    await _sharedPreferences.set<String>(
        sessionDetailsKey(session.identity.id), jsonEncode(session.toJson()));
  }

  SessionEntity? _getSessionDetails(String identityId) {
    final sessionDetails =
        _sharedPreferences.get<String>(sessionDetailsKey(identityId));
    if (sessionDetails != null) {
      Map<String, dynamic> sessionMap = jsonDecode(sessionDetails);
      return SessionEntity.fromJson(sessionMap);
    }
    return null;
  }

  Future<void> _deleteSessionDetails(String identityId) async {
    await _sharedPreferences.remove(sessionDetailsKey(identityId));
  }

  SessionEntity _mapToSessionEntity(Session session) {
    if (session.identity == null) {
      throw StateError('Invalid session: identity is null');
    }
    return SessionEntity(
      id: session.id,
      active: session.active ?? false,
      identity: _mapToIdentityEntity(session.identity!),
      authenticatedAt: session.authenticatedAt ?? DateTime.now(),
      expiresAt:
          session.expiresAt ?? DateTime.now().add(const Duration(hours: 1)),
      issuedAt: session.issuedAt ?? DateTime.now(),
      authenticatorAssuranceLevel: AssuranceLevel.fromString(
          session.authenticatorAssuranceLevel.toString()),
    );
  }

  IdentityEntity _mapToIdentityEntity(Identity identity) {
    return IdentityEntity(
      id: identity.id,
      createdAt: identity.createdAt ?? DateTime.now(),
      updatedAt: identity.updatedAt ?? DateTime.now(),
    );
  }
}
