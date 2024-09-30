import 'package:defy/features/authentication/presentation/provider/states/authentication_flow_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/authentication_flow_manager.g.dart';


@riverpod
class AuthenticationFlowManager extends _$AuthenticationFlowManager {
  @override
  AuthenticationFlowData? build() => null;

  void initializeRegistrationFlow(String flowId, RegistrationData data) {
    state = AuthenticationFlowData.signUp(flowId: flowId, data: data);
  }

  void initializeLoginFlow(String flowId, LoginData data) {
    state = AuthenticationFlowData.signIn(flowId: flowId, data: data);
  }

  void updateRegistrationData(RegistrationData Function(RegistrationData) update) {
    if (state case RegistrationFlowData(:final data)) {
      state = AuthenticationFlowData.signUp(flowId: state!.flowId, data: update(data));
    }
  }

  void updateLoginData(LoginData Function(LoginData) update) {
    if (state case LoginFlowData(:final data)) {
      state = AuthenticationFlowData.signIn(flowId: state!.flowId, data: update(data));
    }
  }

  void resetFlow() {
    state = null;
  }
}