import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/choose_wallet_screen_state.dart';


part 'generated/choose_wallet_screen_provider.g.dart';

@riverpod
class ChooseWalletScreenNotifier extends _$ChooseWalletScreenNotifier {
  @override
  ChooseWalletScreenState build() => const ChooseWalletScreenState();

  void updateIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }

  void updateIsUpdated(bool isUpdated) {
    state = state.copyWith(isUpdated: isUpdated);
  }
}
