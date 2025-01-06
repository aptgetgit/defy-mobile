import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'states/account_data_state.dart';
part 'generated/account_data_state_provider.g.dart';

@Riverpod(keepAlive: true)
class AccountDataState extends _$AccountDataState {
  @override
  AccountData build() {
    return AccountData(
      username: '',
      firstName: '',
      provider: '',
    );
  }

  setUsername(String username) {
    state = state.copyWith(username: username);
  }

  setFirstName(String firstName) {
    state = state.copyWith(firstName: firstName);
  }

  setProvider(String provider) {
    state = state.copyWith(provider: provider);
  }
}