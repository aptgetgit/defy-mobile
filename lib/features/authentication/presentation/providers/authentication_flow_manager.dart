import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:defy/features/authentication/presentation/providers/states/authentication_flow_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/authentication_flow_manager.g.dart';

@Riverpod(keepAlive: true)
class AuthenticationFlowManager extends _$AuthenticationFlowManager {
  @override
  AuthenticationFlowState build() {
    return const AuthenticationFlowState.idle();
  }

  void initializeRegistrationFlow(
      String flowId, InitiateRegistrationOptions options) {
    if (state.maybeMap(
      idle: (_) => false,
      orElse: () => true,
    )) {
      resetFlow();
    }
    state = options.map(
      withEmailCode: (emailOptions) =>
          AuthenticationFlowState.registrationInProgress(
        RegistrationFlowData.withCode(
          flowId: flowId,
          email: emailOptions.email,
          username: emailOptions.username,
          displayName: emailOptions.displayName,
        ),
      ),
      withOIDC: (oidcOptions) => AuthenticationFlowState.registrationInProgress(
        RegistrationFlowData.withOIDC(
          flowId: flowId,
          username: oidcOptions.username,
          displayName: oidcOptions.displayName,
        ),
      ),
    );
  }

  void initializeLoginFlow(String flowId, InitiateLoginOptions options) {
    if (state.maybeMap(
      idle: (_) => false,
      orElse: () => true,
    )) {
      resetFlow();
    }
    state = options.map(
      withEmailCode: (emailOptions) => AuthenticationFlowState.loginInProgress(
        LoginFlowData.withCode(
          flowId: flowId,
          email: emailOptions.email,
        ),
      ),
      withOIDC: (_) => AuthenticationFlowState.loginInProgress(
        LoginFlowData.withOIDC(
          flowId: flowId,
        ),
      ),
    );
  }

  void updateRegistrationFlowWithCode(String code) {
    state.mapOrNull(
      registrationInProgress: (registrationState) {
        final currentData = registrationState.data;
        if (currentData is RegistrationFlowDataWithCode) {
          state = AuthenticationFlowState.registrationInProgress(
            currentData.copyWith(code: code),
          );
        } else {
          _handleFlowMismatch();
        }
      },
    );
  }

  void updateRegistrationFlowWithOIDC(
      {required String provider, required String idToken}) {
    state.mapOrNull(
      registrationInProgress: (registrationState) {
        final currentData = registrationState.data;
        if (currentData is RegistrationFlowDataWithOIDC) {
          state = AuthenticationFlowState.registrationInProgress(
            currentData.copyWith(provider: provider, idToken: idToken),
          );
        } else {
          _handleFlowMismatch();
        }
      },
    );
  }

  void updateLoginFlowWithCode(String code) {
    state.mapOrNull(
      loginInProgress: (loginState) {
        final currentData = loginState.data;
        if (currentData is LoginFlowDataWithCode) {
          state = AuthenticationFlowState.loginInProgress(
            currentData.copyWith(code: code),
          );
        } else {
          _handleFlowMismatch();
        }
      },
    );
  }

  void updateLoginFlowWithOIDC(
      {required String provider, required String idToken}) {
    state.mapOrNull(
      loginInProgress: (loginState) {
        final currentData = loginState.data;
        if (currentData is LoginFlowDataWithOIDC) {
          state = AuthenticationFlowState.loginInProgress(
            currentData.copyWith(provider: provider, idToken: idToken),
          );
        } else {
          _handleFlowMismatch();
        }
      },
    );
  }

  CompleteRegistrationOptions? getCompleteRegistrationOptions() {
    return state.mapOrNull(
      registrationInProgress: (registrationState) {
        return registrationState.data.map(
          withCode: (codeData) {
            if (codeData.code != null) {
              return CompleteRegistrationOptions.withEmailCode(
                flowId: codeData.flowId,
                username: codeData.username,
                displayName: codeData.displayName,
                email: codeData.email,
                code: codeData.code!,
              );
            }
            return null;
          },
          withOIDC: (oidcData) {
            if (oidcData.provider != null && oidcData.idToken != null) {
              return CompleteRegistrationOptions.withOIDC(
                flowId: oidcData.flowId,
                username: oidcData.username,
                displayName: oidcData.displayName,
                provider: oidcData.provider!,
                idToken: oidcData.idToken!,
              );
            }
            return null;
          },
        );
      },
    );
  }

  CompleteLoginOptions? getCompleteLoginOptions() {
    return state.mapOrNull(
      loginInProgress: (loginState) {
        return loginState.data.map(
          withCode: (codeData) {
            if (codeData.code != null) {
              return CompleteLoginOptions.withEmailCode(
                flowId: codeData.flowId,
                identifier: codeData.email,
                code: codeData.code!,
              );
            }
            return null;
          },
          withOIDC: (oidcData) {
            if (oidcData.provider != null && oidcData.idToken != null) {
              return CompleteLoginOptions.withOIDC(
                flowId: oidcData.flowId,
                provider: oidcData.provider!,
                idToken: oidcData.idToken!,
              );
            }
            return null;
          },
        );
      },
    );
  }

  void resetFlow() {
    state = const AuthenticationFlowState.idle();
  }

  void _handleFlowMismatch() {
    // Reset the flow and potentially notify the user or log the event
    resetFlow();
    // TODO: You might want to throw an exception or emit an event here to notify the UI that the flow was reset due to a mismatch.
    AppLogger.error('Authentication flow mismatch detected.');
  }
}
