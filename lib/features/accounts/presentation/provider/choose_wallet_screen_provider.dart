import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/choose_wallet_state.dart';


part 'generated/choose_wallet_screen_provider.g.dart';

@riverpod
class WalletNotifier extends _$WalletNotifier {
  @override
  WalletState build() => const WalletState();

  void updateIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }
}
