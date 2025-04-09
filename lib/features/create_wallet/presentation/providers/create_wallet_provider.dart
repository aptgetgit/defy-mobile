import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/animated_emoji.dart';
import '../../../../core/utils/emoji_utils.dart';
import '../../../../shared/blockchain/account/presentation/providers/generate_account_flow_provider.dart';
import '../../../../shared/blockchain/account/presentation/states/generate_account_flow_state.dart';
import '../state/create_wallet_state.dart';

part 'generated/create_wallet_provider.g.dart';

@riverpod
class CreateWalletNotifier extends _$CreateWalletNotifier {
  @override
  CreateWalletState build() => const CreateWalletState();

  void updateColor(LinearGradient color) {
    state = state.copyWith(selectedWalletColor: color);
  }

  void updateSliderPosition(double position) {
    state = state.copyWith(walletColorSliderPosition: position);
  }

  void updateSelectedColorIndex(int index) {
    state = state.copyWith(walletColorSelectedIndex: index);
  }

  void updateSelectedEmojiIndex(int index) {
    state = state.copyWith(selectedEmojiIndex: index);
  }

  Future<void> generateAccount() async {
    state = state.copyWith(error: null);
    try {
      final GenerateAccountFlow generateAccountFlow =
          ref.read(generateAccountFlowProvider.notifier);
      final GenerateAccountFlowState currentState =
          ref.read(generateAccountFlowProvider);

      if (currentState is GenerateAccountFlowStateWaitingForMetadata) {
        await generateAccountFlow.completeWithMetadata(
          label: state.accountName,
          iconUri: Uri.parse(
            EmojiUtils.getEmojiByIndex(state.selectedEmojiIndex)?.getEmoji ??
                EmojiUtils.getEmojiByIndex(1)!.getEmoji,
          ),
          backgroundColor: state.selectedWalletColor.colors.first,
        );
      } else {
        throw Exception(
            'Account is not in the correct state for adding metadata');
      }

      state = state.copyWith(isAccountGenerated: true, currentStep: 3);
    } on Exception catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  void updateWalletName(String text) {
    state = state.copyWith(
      isWalletNameEntered: text.trim().isNotEmpty,
      accountName: text,
    );
  }

  void navigateToNextSection() {
    if (state.currentStep < 2) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void navigateToPreviousSection() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }
}
