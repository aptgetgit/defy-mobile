import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/authentication_flow_state.freezed.dart';

@freezed
class RegistrationFlowData with _$RegistrationFlowData {
  const factory RegistrationFlowData.withCode({
    required String flowId,
    required String username,
    required String displayName,
    required String email,
    String? code,
  }) = RegistrationFlowDataWithCode;

  const factory RegistrationFlowData.withOIDC({
    required String flowId,
    required String username,
    required String displayName,
    String? provider,
    String? idToken,
  }) = RegistrationFlowDataWithOIDC;
}

@freezed
class LoginFlowData with _$LoginFlowData {
  const factory LoginFlowData.withCode({
    required String flowId,
    required String email,
    String? code,
  }) = LoginFlowDataWithCode;

  const factory LoginFlowData.withOIDC({
    required String flowId,
    String? provider,
    String? idToken,
  }) = LoginFlowDataWithOIDC;
}

@freezed
class AuthenticationFlowState with _$AuthenticationFlowState {
  const factory AuthenticationFlowState.idle() = _Idle;
  const factory AuthenticationFlowState.registrationInProgress(
      RegistrationFlowData data) = _RegistrationInProgress;
  const factory AuthenticationFlowState.loginInProgress(LoginFlowData data) =
      _LoginInProgress;
}
