import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/blockchain/account/domain/entities/account_address.dart';
import '../../../../shared/blockchain/account/presentation/providers/usecase_provider.dart';
import '../state/customize_wallet_state.dart';

part 'generated/customize_wallet_provider.g.dart';

@riverpod
class CustomizeWalletProvider extends _$CustomizeWalletProvider {
  @override
  CustomizeWalletState build() => const CustomizeWalletState();

  void updateColor(Color color) {
    state = state.copyWith(selectedWalletColor: color);
  }

  void updateEmoji(String emoji) {
    state = state.copyWith(selectedEmoji: emoji);
  }

  void updateName(String name) {
    state = state.copyWith(selectedWalletName: name);
  }

  void updateSliderPosition(double position) {
    state = state.copyWith(walletColorSliderPosition: position);
  }

  void updateSelectedIndex(int index) {
    state = state.copyWith(walletColorSelectedIndex: index);
  }

  void showEmojiSection() {
    state = state.copyWith(
      showEmojiSection: true,
      showColorSection: false,
      showNameSection: false,
    );
  }

  void showColorSection() {
    state = state.copyWith(
      showEmojiSection: false,
      showColorSection: true,
      showNameSection: false,
    );
  }

  void showNameSection() {
    state = state.copyWith(
      showEmojiSection: false,
      showColorSection: false,
      showNameSection: true,
    );
  }

  void updateAccountLabel(String name, AccountAddress accountAddress) {
    ref
        .watch(updateAccountLabelUseCaseProvider)
        .call(accountAddress: accountAddress, newLabel: name);
    state = state.copyWith(selectedWalletName: name);
  }

  void updateAccountBackgroundColor(
      Color color, AccountAddress accountAddress) {
    ref
        .watch(updateAccountBackgroundColorUseCaseProvider)
        .call(accountAddress: accountAddress, newBackgroundColor: color);
    state = state.copyWith(selectedWalletColor: color);
  }

  void updateAccountIconUri(String iconUri, AccountAddress accountAddress) {
    ref
        .watch(updateAccountIconUriUseCaseProvider)
        .call(accountAddress: accountAddress, newIconUri: Uri.parse(iconUri));
    state = state.copyWith(selectedEmoji: iconUri);
  }
}
