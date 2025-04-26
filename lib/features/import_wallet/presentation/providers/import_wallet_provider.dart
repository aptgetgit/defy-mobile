import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/animated_emoji.dart';

import '../../../../core/logging/app_logger.dart';
import '../../../../core/utils/emoji_utils.dart';
import '../../../../shared/blockchain/account/presentation/providers/generate_account_flow_provider.dart';

import '../../../../shared/blockchain/account/presentation/states/generate_account_flow_state.dart';

import '../state/import_wallet_state.dart';

part 'generated/import_wallet_provider.g.dart';

@riverpod
class ImportWalletNotifier extends _$ImportWalletNotifier {
  @override
  ImportWalletState build() => const ImportWalletState();

  void updateWords(List<String> words) {
    state = state.copyWith(words: words);
  }

  Future<void> importMnemonic() async {
    state = state.copyWith(isImporting: true, error: null);
    try {
      final String mnemonic = state.words.join(' ');
      await ref.watch(generateAccountFlowProvider.notifier).generateAccount(
          AccountGenerationParams.importMnemonic(mnemonic: mnemonic),);
    } on Exception catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isImporting: false);
    }
  }

  void updateColor(LinearGradient color) {
    state = state.copyWith(selectedWalletColor: color);
  }

  void updateSliderPosition(double position) {
    state = state.copyWith(walletColorSliderPosition: position);
  }

  void updateSelectedIndex(int index) {
    state = state.copyWith(walletColorSelectedIndex: index);
  }

  void updateShowWalletName() {
    state = state.copyWith(showWalletName: true, currentStep: 1);
  }

  void updateShowCreatedWallet() {
    state = state.copyWith(
      showCreatedWallet: true,
      showWalletName: false,
      showWalletColor: false,
      showEmojiPicker: false,
      currentStep: 4,
    );
  }

  Future<void> generateAccount() async {
    state = state.copyWith(isGenerating: true, error: null);
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
                  EmojiUtils.getEmojiByIndex(1)!.getEmoji,),
          backgroundColor: state.selectedWalletColor.colors.first,
        );
      } else {
        throw Exception(
          'Account is not in the correct state for adding metadata',
        );
      }

      updateShowCreatedWallet();
    } on Exception catch (e) {
      state = state.copyWith(error: e.toString(), isGenerating: false);
    }
  }

  void updateWalletName(String text) {
    state = state.copyWith(
      isWalletNameEntered: text.trim().isNotEmpty,
      accountName: text,
    );
  }

  void updateSelectedEmojiIndex(int index) {
    state = state.copyWith(selectedEmojiIndex: index);
  }

  Future<void> navigateToNextSection() async {
    if (state.words.isNotEmpty &&
        (state.words.length == 12 || state.words.length == 24) &&
        !state.isImporting &&
        !state.showWalletName &&
        !state.showWalletColor &&
        !state.showEmojiPicker) {
      state = state.copyWith(showWalletName: true, currentStep: 1);
    } else if (state.showWalletName) {
      state = state.copyWith(
        showWalletName: false,
        showWalletColor: true,
        currentStep: 2,
      );
    } else if (state.showWalletColor) {
      state = state.copyWith(
        showWalletColor: false,
        showEmojiPicker: true,
        currentStep: 3,
      );
    } else if (state.showEmojiPicker) {
      await generateAccount();
    }
  }

  void navigateToPreviousSection() {
    AppLogger.debug('Navigating back from step: ${state.currentStep}');

    switch (state.currentStep) {
      case 4: // Created wallet
        // Do nothing, as we don't want to navigate back from this state
        break;
      case 3: // Emoji picker
        state = state.copyWith(
          showEmojiPicker: false,
          showWalletColor: true,
          currentStep: 2,
        );
      case 2: // Wallet color
        state = state.copyWith(
          showWalletColor: false,
          showWalletName: true,
          currentStep: 1,
        );
      case 1: // Wallet name
        state = state.copyWith(
          showWalletName: false,
          currentStep: 0,
        );
      default:
        break;
    }

    AppLogger.debug('Navigated to step: ${state.currentStep}');
  }
}
