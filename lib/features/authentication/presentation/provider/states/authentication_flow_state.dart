import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/authentication_flow_state.freezed.dart';

@freezed
class RegistrationData with _$RegistrationData {
  const factory RegistrationData.withEmailCode({
    required String email,
    required String username,
    required String name,
    String? code,
  }) = RegistrationWithEmailCode;

  const factory RegistrationData.withOIDC({
    required String username,
    required String name,
    String? provider,
    String? idToken,
  }) = RegistrationWithOIDC;
}

@freezed
class LoginData with _$LoginData {
  const factory LoginData.withEmailCode({
    required String email,
    String? code,
  }) = LoginWithEmailCode;

  const factory LoginData.withOIDC({
    String? provider,
    String? idToken,
  }) = LoginWithOIDC;
}

@freezed
class AuthenticationFlowData with _$AuthenticationFlowData {
  const factory AuthenticationFlowData.signUp({
    required String flowId,
    required RegistrationData data,
  }) = RegistrationFlowData;

  const factory AuthenticationFlowData.signIn({
    required String flowId,
    required LoginData data,
  }) = LoginFlowData;
}
