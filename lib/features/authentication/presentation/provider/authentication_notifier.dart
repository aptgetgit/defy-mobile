import 'package:defy/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:defy/features/authentication/presentation/provider/authentication_flow_manager.dart';
import 'package:defy/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:defy/features/authentication/presentation/provider/states/authentication_flow_state.dart';
import 'package:defy/features/authentication/presentation/provider/states/authentication_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/authentication_notifier.g.dart';

@riverpod
class AuthenticationNotifier extends _$AuthenticationNotifier {
  @override
  FutureOr<AuthenticationState> build() {
    return _initialize();
  }

  Future<AuthenticationState> _initialize() async {
    try {
      final activeIdentityId =
          ref.read(getActiveIdentityUseCaseProvider).call();
      if (activeIdentityId != null) {
        final token = await ref
            .read(getSessionTokenUseCaseProvider)
            .call(activeIdentityId);
        final sessionDetails = await ref
            .read(getSessionDetailsUseCaseProvider)
            .call(activeIdentityId);
        if (sessionDetails.isActive && !sessionDetails.isExpired) {
          final currentSession =
              await ref.read(getCurrentSessionUseCaseProvider).call(token);
          if (currentSession.isActive &&
              !currentSession.isExpired) {
            return AuthenticationState.authenticated(currentSession);
          }
        }
      }
      return const AuthenticationState.unauthenticated();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> initiateLogin(InitiateLoginOptions options) async {
    state = const AsyncValue.loading();
    try {
      final flowId =
          await ref.read(initiateLoginUseCaseProvider).call(options);
      final signInData = options.map(
        withEmailCode: (e) => LoginData.withEmailCode(email: e.email),
        withOIDC: (_) => const LoginData.withOIDC(),
      );
      ref
          .read(authenticationFlowManagerProvider.notifier)
          .initializeLoginFlow(flowId, signInData);
      state = const AsyncValue.data(AuthenticationState.authenticating());
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> completeLogin(CompleteLoginOptions options) async {
    state = const AsyncValue.loading();
    try {
      final flowManager = ref.read(authenticationFlowManagerProvider.notifier);
      final flowData = ref.read(authenticationFlowManagerProvider);
      if (flowData == null || flowData is! LoginFlowData) {
        throw Exception("Sign-in flow not properly initiated");
      }

      final session =
          await ref.read(completeLoginUseCaseProvider).call(options);
      await ref
          .read(setActiveIdentityUseCaseProvider)
          .call(session.identity.id);
      flowManager.resetFlow();
      state = AsyncValue.data(AuthenticationState.authenticated(session));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> initiateRegistration(InitiateRegistrationOptions options) async {
    state = const AsyncValue.loading();
    try {
      final flowId =
          await ref.read(initiateRegistrationUseCaseProvider).call(options);
      final signUpData = options.map(
        withEmailCode: (e) => RegistrationData.withEmailCode(
          email: e.email,
          username: e.username,
          name: e.name,
        ),
        withOIDC: (o) => RegistrationData.withOIDC(
          username: o.username,
          name: o.name,
        ),
      );
      ref
          .read(authenticationFlowManagerProvider.notifier)
          .initializeRegistrationFlow(flowId, signUpData);
      state = const AsyncValue.data(AuthenticationState.authenticating());
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> completeRegistration(CompleteRegistrationOptions options) async {
    state = const AsyncValue.loading();
    try {
      final flowManager = ref.read(authenticationFlowManagerProvider.notifier);
      final flowData = ref.read(authenticationFlowManagerProvider);
      if (flowData == null || flowData is! RegistrationFlowData) {
        throw Exception("Sign-up flow not properly initiated");
      }

      final session =
          await ref.read(completeRegistrationUseCaseProvider).call(options);
      await ref
          .read(setActiveIdentityUseCaseProvider)
          .call(session.identity.id);
      flowManager.resetFlow();
      state = AsyncValue.data(AuthenticationState.authenticated(session));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    try {
      final activeIdentityId =
          ref.read(getActiveIdentityUseCaseProvider).call();
      if (activeIdentityId != null) {
        await ref.read(logoutUseCaseProvider).call(activeIdentityId);
      }
      state = const AsyncValue.data(AuthenticationState.unauthenticated());
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<String?> signInWithGoogle() async {
    try {
      final credential = await ref.read(signInWithGoogleUseCaseProvider).call();
      return credential.idToken;
    } catch (e) {
      return null;
    }
  }
}
