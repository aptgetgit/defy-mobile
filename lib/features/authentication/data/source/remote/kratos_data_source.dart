import 'package:one_of/one_of.dart';
import 'package:ory_kratos_client/ory_kratos_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:built_value/json_object.dart';

part 'generated/kratos_data_source.freezed.dart';

@freezed
class KratosCreateNativeRegistrationFlowOptions with _$KratosCreateNativeRegistrationFlowOptions {
  const factory KratosCreateNativeRegistrationFlowOptions.withCode() = KratosCreateNativeRegistrationFlowWithCodeOptions;
  const factory KratosCreateNativeRegistrationFlowOptions.withOIDC() = KratosCreateNativeRegistrationFlowWithOIDCOptions;
}

@freezed
class KratosCreateNativeLoginFlowOptions with _$KratosCreateNativeLoginFlowOptions {
  const factory KratosCreateNativeLoginFlowOptions.withCode() = KratosCreateNativeLoginFlowWithCodeOptions;
  const factory KratosCreateNativeLoginFlowOptions.withOIDC() = KratosCreateNativeLoginFlowWithOIDCOptions;
}

@freezed
class KratosUpdateNativeRegistrationFlowOptions with _$KratosUpdateNativeRegistrationFlowOptions {
  const factory KratosUpdateNativeRegistrationFlowOptions.withCode({
    required String flowId,
    required JsonObject traits,
    String? code,
  }) = KratosUpdateNativeRegistrationFlowWithCodeOptions;

  const factory KratosUpdateNativeRegistrationFlowOptions.withOIDC({
    required String flowId,
    required JsonObject traits,
    required String provider,
    required String idToken,
  }) = KratosUpdateNativeRegistrationFlowWithOIDCOptions;
}

@freezed
class KratosUpdateNativeLoginFlowOptions with _$KratosUpdateNativeLoginFlowOptions {
  const factory KratosUpdateNativeLoginFlowOptions.withCode({
    required String flowId,
    required String identifier,
    String? code,
  }) = KratosUpdateNativeLoginFlowWithCodeOptions;

  const factory KratosUpdateNativeLoginFlowOptions.withOIDC({
    required String flowId,
    required String provider,
    required String idToken,
  }) = KratosUpdateNativeLoginFlowWithOIDCOptions;
}

abstract class KratosDataSource {
  Future<RegistrationFlow?> createNativeRegistrationFlow(KratosCreateNativeRegistrationFlowOptions options);
  Future<LoginFlow?> createNativeLoginFlow(KratosCreateNativeLoginFlowOptions options);
  Future<Session?> getCurrentSession(String sessionToken);
  Future<SuccessfulNativeLogin?> updateNativeLoginFlow(KratosUpdateNativeLoginFlowOptions options);
  Future<SuccessfulNativeRegistration?> updateNativeRegistrationFlow(KratosUpdateNativeRegistrationFlowOptions options);
  Future<void> logout(String sessionToken);
}

class KratosDataSourceImpl implements KratosDataSource {
  final FrontendApi _frontendApi;

  KratosDataSourceImpl(this._frontendApi);

  @override
  Future<void> logout(String sessionToken) async {
    await _frontendApi.performNativeLogout(
      performNativeLogoutBody: PerformNativeLogoutBody((b) => b..sessionToken = sessionToken),
    );
  }

  @override
  Future<Session?> getCurrentSession(String sessionToken) async {
    final response = await _frontendApi.toSession(
      headers: {'Authorization': 'Bearer $sessionToken'},
    );
    return response.data;
  }

  @override
  Future<RegistrationFlow?> createNativeRegistrationFlow(KratosCreateNativeRegistrationFlowOptions options) async {
    final response = await options.when(
      withCode: () => _frontendApi.createNativeRegistrationFlow(),
      withOIDC: () => _frontendApi.createNativeRegistrationFlow(),
    );
    if (response.data == null) {
      throw StateError('Failed to create native login flow');
    }
    return response.data;
  }

  @override
  Future<LoginFlow?> createNativeLoginFlow(KratosCreateNativeLoginFlowOptions options) async {
    final response = await options.when(
      withCode: () => _frontendApi.createNativeLoginFlow(),
      withOIDC: () => _frontendApi.createNativeLoginFlow(),
    );
    return response.data;
  }

  @override
  Future<SuccessfulNativeRegistration?> updateNativeRegistrationFlow(KratosUpdateNativeRegistrationFlowOptions options) async {
    final response = await options.when(
      withCode: (flowId, traits, code) => _frontendApi.updateRegistrationFlow(
        flow: flowId,
        updateRegistrationFlowBody: UpdateRegistrationFlowBody(
          (b) => b
            ..oneOf = OneOf.fromValue1(
              value: UpdateRegistrationFlowWithCodeMethod((b) => b
                ..code = code
                ..method = 'code'
                ..traits = traits),
            ),
        ),
      ),
      withOIDC: (flowId, traits, provider, idToken) => _frontendApi.updateRegistrationFlow(
        flow: flowId,
        updateRegistrationFlowBody: UpdateRegistrationFlowBody(
          (b) => b
            ..oneOf = OneOf.fromValue1(
              value: UpdateRegistrationFlowWithOidcMethod((b) => b
                ..provider = provider
                ..method = 'oidc'
                ..idToken = idToken
                ..traits = traits),
            ),
        ),
      ),
    );
    return response.data;
  }

  @override
  Future<SuccessfulNativeLogin?> updateNativeLoginFlow(KratosUpdateNativeLoginFlowOptions options) async {
    final response = await options.when(
      withCode: (flowId, identifier, code) => _frontendApi.updateLoginFlow(
        flow: flowId,
        updateLoginFlowBody: UpdateLoginFlowBody(
          (b) => b
            ..oneOf = OneOf.fromValue1(
              value: UpdateLoginFlowWithCodeMethod((b) => b
                ..method = 'code'
                ..code = code
                ..identifier = identifier),
            ),
        ),
      ),
      withOIDC: (flowId, provider, idToken) => _frontendApi.updateLoginFlow(
        flow: flowId,
        updateLoginFlowBody: UpdateLoginFlowBody(
          (b) => b
            ..oneOf = OneOf.fromValue1(
              value: UpdateLoginFlowWithOidcMethod((b) => b
                ..provider = provider
                ..method = 'oidc'
                ..idToken = idToken),
            ),
        ),
      ),
    );
    return response.data;
  }
}