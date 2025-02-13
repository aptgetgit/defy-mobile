import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/account/presentation/providers/generate_account_flow_provider.dart';
import '../../../../shared/account/presentation/states/generate_account_flow_state.dart';
import '../state/import_wallet_state.dart';

part 'generated/import_wallet_provider.g.dart';

@riverpod
class ImportWalletNotifier extends _$ImportWalletNotifier {
  @override
  ImportWalletState build() => const ImportWalletState();

  void updateWords(List<String> words) {
    state = state.copyWith(words: words);
  }

  void setCurrentPage(int page) {
    state = state.copyWith(
      previousPage: state.currentPage,
      currentPage: page,
    );
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
          iconUri: Uri.parse('https://blockorps.com/images/Avex-LogoFinal.png'),
          backgroundColor: const Color.fromARGB(255, 61, 37, 165),
        );
      } else {
        throw Exception(
            'Account is not in the correct state for adding metadata',);
      }

      state = state.copyWith(isGenerating: false, isAccountGenerated: true);
    } on Exception catch (e) {
      state = state.copyWith(error: e.toString(), isGenerating: false);
    }
  }

  void updateAccountName(String accountName) {
    state = state.copyWith(accountName: accountName);
  }

  void continueFromAccountName() {}

  void updateColor(Color color) {
    state = state.copyWith(selectedWalletColor: color);
  }

  void updateSliderPosition(double position) {
    state = state.copyWith(walletColorSliderPosition: position);
  }

  void updateSelectedIndex(int index) {
    state = state.copyWith(walletColorSelectedIndex: index);
  }

  void updateSelectedEmojiIndex(int index) {
    state = state.copyWith(selectedEmojiIndex: index);
  }
}
