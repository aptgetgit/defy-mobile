import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/animated_emoji.dart';

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
      await ref
          .read(generateAccountFlowProvider.notifier)
          .importMnemonic(mnemonic);
    } on Exception catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isImporting: false);
    }
  }

  void updateColor(Color color) {
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
                  EmojiUtils.getEmojiByIndex(1)!.getEmoji),
          backgroundColor: state.selectedWalletColor,
        );
      } else {
        throw Exception(
          'Account is not in the correct state for adding metadata',
        );
      }

      state = state.copyWith(
          isGenerating: false, isAccountGenerated: true, currentStep: 4);
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
    if (state.words.isEmpty) {
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
    if (state.showEmojiPicker) {
      state = state.copyWith(
        showEmojiPicker: false,
        showWalletColor: true,
        currentStep: 2,
      );
    } else if (state.showWalletColor) {
      state = state.copyWith(
        showWalletColor: false,
        showWalletName: true,
        currentStep: 1,
      );
    } else if (state.showWalletName) {
      state = state.copyWith(showWalletName: false, currentStep: 0);
    }
  }
}
