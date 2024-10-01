import 'package:defy/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:defy/features/authentication/presentation/provider/authentication_flow_manager.dart';
import 'package:defy/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:defy/features/authentication/presentation/provider/states/authentication_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/authentication_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthenticationNotifier extends _$AuthenticationNotifier {
  @override
  Future<AuthenticationState> build() {
    return _initialize();
  }

  Future<AuthenticationState> _initialize() async {
    try {
      final activeIdentityId = ref.read(getActiveIdentityUseCaseProvider).call();
      if (activeIdentityId != null) {
        final token = await ref.read(getSessionTokenUseCaseProvider).call(activeIdentityId);
        final sessionDetails = await ref.read(getSessionDetailsUseCaseProvider).call(activeIdentityId);
        if (sessionDetails.isActive && !sessionDetails.isExpired) {
          final currentSession = await ref.read(getCurrentSessionUseCaseProvider).call(token);
          if (currentSession.isActive && !currentSession.isExpired) {
            return AuthenticationState.authenticated(currentSession);
          }
        }
      }
      return const AuthenticationState.unauthenticated();
    } catch (e) {
      return const AuthenticationState.unauthenticated();
    }
  }

  Future<void> initiateLogin(InitiateLoginOptions options) async {
    state = const AsyncValue.loading();
    try {
      final flowId = await ref.read(initiateLoginUseCaseProvider).call(options);
      ref.read(authenticationFlowManagerProvider.notifier).initializeLoginFlow(flowId, options);
      state = const AsyncValue.data(AuthenticationState.authenticating());
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> completeLogin() async {
    state = const AsyncValue.loading();
    try {
      final flowManager = ref.read(authenticationFlowManagerProvider.notifier);
      final completeOptions = flowManager.getCompleteLoginOptions();
      if (completeOptions == null) {
        throw Exception("Login flow not properly initiated or missing data");
      }

      final session = await ref.read(completeLoginUseCaseProvider).call(completeOptions);
      await ref.read(setActiveIdentityUseCaseProvider).call(session.identity.id);
      flowManager.resetFlow();
      state = AsyncValue.data(AuthenticationState.authenticated(session));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> initiateRegistration(InitiateRegistrationOptions options) async {
    state = const AsyncValue.loading();
    try {
      final flowId = await ref.read(initiateRegistrationUseCaseProvider).call(options);
      ref.read(authenticationFlowManagerProvider.notifier).initializeRegistrationFlow(flowId, options);
      state = const AsyncValue.data(AuthenticationState.authenticating());
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> completeRegistration() async {
    state = const AsyncValue.loading();
    try {
      final flowManager = ref.read(authenticationFlowManagerProvider.notifier);
      final completeOptions = flowManager.getCompleteRegistrationOptions();
      if (completeOptions == null) {
        throw Exception("Registration flow not properly initiated or missing data");
      }

      final session = await ref.read(completeRegistrationUseCaseProvider).call(completeOptions);
      await ref.read(setActiveIdentityUseCaseProvider).call(session.identity.id);
      flowManager.resetFlow();
      state = AsyncValue.data(AuthenticationState.authenticated(session));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    try {
      final activeIdentityId = ref.read(getActiveIdentityUseCaseProvider).call();
      if (activeIdentityId != null) {
        await ref.read(logoutUseCaseProvider).call(activeIdentityId);
      }
      state = const AsyncValue.data(AuthenticationState.unauthenticated());
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  // Future<void> updateAuthenticationFlow({String? code, String? provider, String? idToken, String? email}) async {
  //   final flowManagerState = ref.read(authenticationFlowManagerProvider);
  //   final flowManager = ref.read(authenticationFlowManagerProvider.notifier);
  //   flowManagerState.map(
  //     idle: (_) {},
  //     registrationInProgress: (_) => flowManager.updateRegistrationFlow(code: code, provider: provider, idToken: idToken, email: email),
  //     loginInProgress: (_) => flowManager.updateLoginFlow(code: code, provider: provider, idToken: idToken, email: email),
  //   );
  // }
}