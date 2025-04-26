import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/constants/bip39_wordlist.dart';
import '../../../../core/error/exception_with_stack_trace.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../shared/blockchain/account/domain/entities/aptos_account_with_metadata.dart';
import '../../../../shared/blockchain/account/domain/usecases/list_aptos_account_usecase.dart';
import '../../../../shared/blockchain/account/presentation/providers/generate_account_flow_provider.dart';
import '../../../../shared/blockchain/account/presentation/providers/usecase_provider.dart';
import '../../../../shared/blockchain/account/presentation/states/generate_account_flow_state.dart';
import '../../../accounts/presentation/util/helpers.dart';
import '../../../common/presentation/widgets/black_button.dart';
import '../components/import_wallet_account_name_section.dart';
import '../components/import_wallet_created_wallet_section.dart';
import '../components/import_wallet_emoji_selection_section.dart';
import '../components/import_wallet_wallet_card.dart';
import '../components/import_wallet_wallet_color_selection_section.dart';
import '../constants/import_wallet_ui_constants.dart';
import '../providers/import_wallet_provider.dart';
import '../state/import_wallet_state.dart';
import 'import_wallet_import_seed_phrase_screen.dart';

class ImportWalletScreen extends StatefulHookConsumerWidget {
  const ImportWalletScreen({super.key});

  @override
  ConsumerState<ImportWalletScreen> createState() => _ImportWalletScreenState();
}

class _ImportWalletScreenState extends ConsumerState<ImportWalletScreen>
    with SingleTickerProviderStateMixin {
  late TextEditingController nameTextFieldController;
  late FocusNode nameTextFieldFocusNode;
  late ValueNotifier<bool> isEditing;
  late ValueNotifier<bool> hasModifiedName;
  late ValueNotifier<bool> shouldRequestFocus;
  late AnimationController colorAnimationController;
  Set<String> existingWalletNames = <String>{};
  bool _isFrontCard = true;
  bool _isFlipping = false;
  Timer? _flipTimer;
  int _flipCount = 0;

  @override
  void initState() {
    super.initState();

    final ImportWalletState importWalletState =
        ref.read(importWalletNotifierProvider);

    nameTextFieldController =
        TextEditingController(text: importWalletState.accountName);
    nameTextFieldFocusNode = FocusNode();
    isEditing = ValueNotifier<bool>(false);
    hasModifiedName = ValueNotifier<bool>(false);
    shouldRequestFocus = ValueNotifier<bool>(false);

    colorAnimationController = AnimationController(
      duration: ImportWalletConstants.animationDuration,
      vsync: this,
    );

    nameTextFieldController.addListener(_onNameTextFieldChanged);
    nameTextFieldFocusNode.addListener(_onFocusNodeChanged);

    Future<void>.microtask(_initializeWalletNames);
  }

  Future<void> _initializeWalletNames() async {
    final ListAptosAccountsUseCase listAptosAccountUsecaseProvider =
        ref.read(listAptosAccountsUseCaseProvider);
    final Either<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>
        result = await listAptosAccountUsecaseProvider.call();
    result.fold(
      (ExceptionWithStackTrace error) {
        // Handle the error case
        AppLogger.error('Failed to fetch accounts: $error');
      },
      (Set<AptosAccountWithMetadata> accountsSet) {
        // Handle the success case
        existingWalletNames = accountsSet
            .map((AptosAccountWithMetadata account) => account.label)
            .toSet();
      },
    );
  }

  void _onNameTextFieldChanged() {
    final ImportWalletState importWalletState =
        ref.read(importWalletNotifierProvider);
    final ImportWalletNotifier importWalletNotifier =
        ref.read(importWalletNotifierProvider.notifier);

    final bool isModified =
        nameTextFieldController.text != importWalletState.accountName;
    hasModifiedName.value = isModified;
    importWalletNotifier.updateWalletName(nameTextFieldController.text);
  }

  void _onFocusNodeChanged() {
    isEditing.value = nameTextFieldFocusNode.hasFocus;
  }

  @override
  void dispose() {
    nameTextFieldController.removeListener(_onNameTextFieldChanged);
    nameTextFieldFocusNode.removeListener(_onFocusNodeChanged);

    nameTextFieldController.dispose();
    nameTextFieldFocusNode.dispose();
    colorAnimationController.dispose();

    _flipTimer?.cancel();

    super.dispose();
  }

  void _handleStateChangesOutsideBuild(WidgetRef ref, BuildContext context) {
    final GenerateAccountFlowState accountFlowState =
        ref.watch(generateAccountFlowProvider);
    final ImportWalletNotifier importWalletNotifier =
        ref.read(importWalletNotifierProvider.notifier);

    if (accountFlowState is GenerateAccountFlowStateError) {
      _showErrorSnackBar(context, accountFlowState.message);
    } else if (accountFlowState is GenerateAccountFlowStateWaitingForMetadata) {
      Future<void>.microtask(() {
        importWalletNotifier.updateShowWalletName();
        shouldRequestFocus.value = true;
      });
    } else if (accountFlowState is GenerateAccountFlowStateReady) {
      AppLogger.debug('Account generated successfully');
      AppLogger.debug('Account ID: ${accountFlowState.account}');

      Future<void>.microtask(importWalletNotifier.updateShowCreatedWallet);
    }

    if (shouldRequestFocus.value) {
      AppLogger.debug('Requesting focus on nameTextField');
      nameTextFieldFocusNode.requestFocus();
      shouldRequestFocus.value = false;
    }
  }

  void _handleStateChanges(
    BuildContext context,
    GenerateAccountFlowState state,
  ) {
    if (state is GenerateAccountFlowStateError) {
      _showErrorSnackBar(context, state.message);
    } else if (state is GenerateAccountFlowStateWaitingForMetadata) {
      AppLogger.debug('shouldRequestFocus: ${shouldRequestFocus.value}');
      shouldRequestFocus.value = true;
    } else if (state is GenerateAccountFlowStateReady) {
      AppLogger.debug('Account generated successfully');
    }

    if (shouldRequestFocus.value) {
      AppLogger.debug('Requesting focus on nameTextField');
      nameTextFieldFocusNode.requestFocus();
      shouldRequestFocus.value = false;
    }
  }

  void _animateSlider(int index, LinearGradient newColor) {
    ref.read(importWalletNotifierProvider.notifier)
      ..updateSliderPosition(index.toDouble())
      ..updateColor(newColor)
      ..updateSelectedIndex(index);
    colorAnimationController.forward(from: 0);
  }

  void _onTextChanged(String value) {
    final ImportWalletState importWalletState =
        ref.read(importWalletNotifierProvider);
    final ImportWalletNotifier importWalletNotifier =
        ref.read(importWalletNotifierProvider.notifier);

    final bool isModified = value != importWalletState.accountName;
    hasModifiedName.value = isModified;
    importWalletNotifier.updateWalletName(value);
  }

  Future<void> _showDuplicateNameDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      barrierColor: Colors.black.withOpacity(0.65),
      barrierDismissible: false,
      builder: (BuildContext context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          clipBehavior: Clip.antiAlias,
          content: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.white,
                  Colors.grey.shade50,
                ],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Icon(
                    PhosphorIconsBold.warning,
                    color: Colors.redAccent,
                    size: 48,
                  ),
                ).animate().fadeIn(duration: 300.ms).scale(
                      begin: const Offset(0.9, 0.9),
                      end: const Offset(1, 1),
                      duration: 400.ms,
                      curve: Curves.easeOutExpo,
                    ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 16, 24, 8),
                  child: Text(
                    'Duplicate Wallet Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black,
                      letterSpacing: -0.5,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ).animate().fadeIn(delay: 200.ms, duration: 300.ms),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                  child: Text(
                    'A wallet with this name already exists.\nPlease choose a different name.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.7),
                      height: 1.6,
                      letterSpacing: 0.1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ).animate().fadeIn(delay: 350.ms, duration: 300.ms),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      shadowColor: Colors.transparent,
                    ),
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ).animate().fadeIn(delay: 500.ms, duration: 400.ms).scale(
                      delay: 500.ms,
                      duration: 400.ms,
                      begin: const Offset(0.95, 0.95),
                      end: const Offset(1, 1),
                      curve: Curves.easeOutQuart,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ImportWalletState importWalletState =
        ref.watch(importWalletNotifierProvider);
    final ImportWalletNotifier importWalletNotifier =
        ref.watch(importWalletNotifierProvider.notifier);
    final GenerateAccountFlowState accountFlowState =
        ref.watch(generateAccountFlowProvider);

    useEffect(
      () {
        _handleStateChangesOutsideBuild(ref, context);
        _handleStateChanges(context, accountFlowState);
        return null;
      },
      <Object?>[accountFlowState],
    );

    return Scaffold(
      appBar: _buildAppBar(context, importWalletState, importWalletNotifier),
      body: PopScope(
        canPop: _canPop(importWalletState),
        onPopInvoked: (bool didPop) =>
            _handlePopInvoked(didPop, importWalletNotifier),
        child: GestureDetector(
          onTap: nameTextFieldFocusNode.unfocus,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    _buildSeedPhraseSection(
                      importWalletState,
                      importWalletNotifier,
                    ),
                    _buildWalletNameSection(
                      importWalletState,
                      importWalletNotifier,
                    ),
                    _buildWalletColorSection(
                      importWalletState,
                      importWalletNotifier,
                    ),
                    _buildCreatedWalletSection(
                      importWalletState,
                      importWalletNotifier,
                    ),
                    _buildWalletCard(
                      context,
                      importWalletState,
                    ),
                    _buildEmojiPickerSection(
                      importWalletState,
                      importWalletNotifier,
                    ),
                    if (accountFlowState is GenerateAccountFlowStateImporting)
                      const Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
              _buildBottomButton(importWalletState, importWalletNotifier),
            ],
          ),
        ),
      ),
    );
  }

  bool _canPop(ImportWalletState state) =>
      !(state.showEmojiPicker || state.showWalletColor || state.showWalletName);

  void _handlePopInvoked(bool didPop, ImportWalletNotifier notifier) {
    if (didPop) {
      return;
    }
    if (nameTextFieldFocusNode.hasFocus) {
      nameTextFieldFocusNode.unfocus();
    }
    notifier.navigateToPreviousSection();
  }

  Widget _buildSeedPhraseSection(
    ImportWalletState state,
    ImportWalletNotifier notifier,
  ) =>
      _buildAnimatedSection(
        condition: !(state.showWalletName ||
                state.showWalletColor ||
                state.showEmojiPicker ||
                state.showCreatedWallet) &&
            state.currentStep == 0,
        child: ImportWalletImportSeedPhraseScreen(
          key: const ValueKey<String>('importScreen'),
          words: state.words,
          onWordsUpdated: notifier.updateWords,
        ),
      );

  Widget _buildWalletNameSection(
    ImportWalletState state,
    ImportWalletNotifier notifier,
  ) =>
      _buildAnimatedSection(
        condition: state.showWalletName && state.currentStep == 1,
        child: WalletNameSection(
          hasModifiedName: hasModifiedName.value,
          isEditing: isEditing.value,
          importWalletState: state,
          importWalletNotifier: notifier,
        ),
      );

  Widget _buildWalletColorSection(
    ImportWalletState state,
    ImportWalletNotifier notifier,
  ) =>
      _buildAnimatedSection(
        condition: state.showWalletColor && state.currentStep == 2,
        child: WalletColorSection(
          animateSlider: _animateSlider,
          importWalletNotifier: notifier,
          importWalletState: state,
        ),
      );

  Widget _buildEmojiPickerSection(
    ImportWalletState state,
    ImportWalletNotifier notifier,
  ) =>
      _buildAnimatedSection(
        condition: state.showEmojiPicker && state.currentStep == 3,
        child: WalletEmojiSection(
          importWalletNotifier: notifier,
          importWalletState: state,
        ),
      );

  Widget _buildWalletCard(BuildContext context, ImportWalletState state) {
    final GenerateAccountFlowState accountFlowState =
        ref.watch(generateAccountFlowProvider);
    String walletAddress = 'Wallet Address';
    if (accountFlowState is GenerateAccountFlowStateReady) {
      walletAddress =
          truncateAddress(accountFlowState.account.accountAddress.toHex());
    }
    AppLogger.debug('Wallet Address: $walletAddress');
    return WalletCard(
      state: state,
      controller: nameTextFieldController,
      focusNode: nameTextFieldFocusNode,
      onTextChanged: _onTextChanged,
      context: context,
      existingWalletNames: existingWalletNames,
      isFrontCard: _isFrontCard,
      walletAddress: walletAddress,
      isFlipping: _isFlipping,
    );
  }

  Widget _buildBottomButton(
    ImportWalletState state,
    ImportWalletNotifier notifier,
  ) =>
      BlackButtonXL(
        color: _getButtonColor(state),
        onClick: () async {
          final GenerateAccountFlowState accountFlowState =
              ref.watch(generateAccountFlowProvider);
          if (state.words.isEmpty) {
            AppLogger.debug(
              'State words are empty, attempting to paste from clipboard.',
            );
            await _pasteFromClipboard(context, notifier);
          }
          if (state.showEmojiPicker && state.selectedEmojiIndex == -1) {
            _showErrorSnackBar(context, 'Please select an emoji');
            return;
          }

          if (state.words.isEmpty) {
            AppLogger.debug(
              'State words are empty, attempting to paste from clipboard.',
            );
            await _pasteFromClipboard(context, notifier);
          } else if (state.showWalletColor || state.showEmojiPicker) {
            AppLogger.debug(
              'Navigating to the next section: showWalletColor or showEmojiPicker is true.',
            );
            await notifier.navigateToNextSection();
          } else if (state.showWalletName) {
            AppLogger.debug('Checking for duplicate wallet names.');
            if (existingWalletNames
                .contains(nameTextFieldController.text.trim())) {
              AppLogger.debug(
                'Duplicate wallet name found, showing duplicate name dialog.',
              );
              await _showDuplicateNameDialog(context);
            } else {
              AppLogger.debug(
                'No duplicate wallet name found, navigating to the next section.',
              );
              if ((!state.isWalletNameEntered && state.accountName.isEmpty) ||
                  state.accountName.isEmpty) {
                notifier.updateWalletName(
                  'Account ${existingWalletNames.length + 1}',
                );
              }
              await notifier.navigateToNextSection();
            }
            if (state.words.isNotEmpty &&
                accountFlowState
                    is GenerateAccountFlowStateWaitingForMetadata &&
                state.currentStep == 0) {
              await notifier.navigateToNextSection();
            }
          } else {
            AppLogger.debug('Importing mnemonic.');
            await notifier.importMnemonic();
          }
        },
        title: state.words.isEmpty ? 'Paste from Clipboard' : 'Continue',
      );

  Color _getButtonColor(ImportWalletState state) {
    if (state.currentStep == 0) {
      if (state.words.isEmpty) {
        return AppColors.blue;
      } else if (state.words.length != 12 && state.words.length != 24) {
        return Colors.grey;
      }
    } else if (state.currentStep == 3 &&
        state.showEmojiPicker &&
        state.selectedEmojiIndex == -1) {
      return Colors.grey;
    }

    return AppColors.black;
  }

  Widget _buildCreatedWalletSection(
    ImportWalletState state,
    ImportWalletNotifier notifier,
  ) {
    final GenerateAccountFlowState accountFlowState =
        ref.watch(generateAccountFlowProvider);
    String walletAddress = 'Wallet Address';
    if (accountFlowState is GenerateAccountFlowStateReady) {
      walletAddress =
          truncateAddress(accountFlowState.account.accountAddress.toHex());
    }
    AppLogger.debug('Wallet Address: $walletAddress');
    AppLogger.debug('Account Flow State: $accountFlowState');

    return _buildAnimatedSection(
      condition: state.showCreatedWallet,
      child: ImportWalletCreatedWalletSection(
        state: state,
        notifier: notifier,
      ),
    );
  }

  Widget _buildAnimatedSection({
    required bool condition,
    required Widget child,
  }) =>
      AnimatedOpacity(
        duration: ImportWalletConstants.animationDuration,
        curve: Curves.easeInOutCubic,
        opacity: condition ? 1.0 : 0.0,
        child: Visibility(visible: condition, child: child),
      );

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message.contains('Entropy already exists')
              ? 'This wallet has already been imported'
              : 'Error: $message',
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> _pasteFromClipboard(
    BuildContext context,
    ImportWalletNotifier notifier,
  ) async {
    final ClipboardData? clipboardData =
        await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData?.text == null) {
      return;
    }

    final List<String> pastedWords = clipboardData!.text!
        .toLowerCase()
        .trim()
        .split(RegExp(r'\s+'))
        .where(bip39Wordlist.contains)
        .toList();

    if (!context.mounted) {
      return;
    }

    if (pastedWords.isEmpty) {
      _showSnackBar(context, 'Clipboard does not contain a valid seed phrase');
      return;
    }

    if (pastedWords.length > 24) {
      _showSnackBar(context, 'Seed phrase cannot exceed 24 words');
      return;
    }

    notifier.updateWords(pastedWords);
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    ImportWalletState state,
    ImportWalletNotifier notifier,
  ) =>
      AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if (state.showEmojiPicker ||
                    state.showWalletColor ||
                    state.showWalletName) {
                  notifier.navigateToPreviousSection();
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: state.currentStep != 4
                  ? const Icon(PhosphorIconsBold.caretLeft)
                  : const SizedBox.shrink(),
            ),
            const Spacer(),
            ..._buildProgressIndicators(state.currentStep),
            const Spacer(),
          ],
        ),
      );

  List<Widget> _buildProgressIndicators(int currentPage) =>
      List<Widget>.generate(
        4,
        (int index) => _buildProgressIndicator(index, currentPage),
      );

  Widget _buildProgressIndicator(int index, int currentPage) =>
      AnimatedContainer(
        height: currentPage == index ? 6 : 4,
        width: currentPage == index ? 64 : 42,
        margin: const EdgeInsets.symmetric(horizontal: 1),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: currentPage >= index
              ? AppColors.greenLight
              : AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(40),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<TextEditingController>(
          'nameTextFieldController',
          nameTextFieldController,
        ),
      )
      ..add(
        DiagnosticsProperty<FocusNode>(
          'nameTextFieldFocusNode',
          nameTextFieldFocusNode,
        ),
      )
      ..add(DiagnosticsProperty<ValueNotifier<bool>>('isEditing', isEditing))
      ..add(
        DiagnosticsProperty<ValueNotifier<bool>>(
          'hasModifiedName',
          hasModifiedName,
        ),
      )
      ..add(
        DiagnosticsProperty<ValueNotifier<bool>>(
          'shouldRequestFocus',
          shouldRequestFocus,
        ),
      )
      ..add(
        DiagnosticsProperty<AnimationController>(
          'colorAnimationController',
          colorAnimationController,
        ),
      )
      ..add(
        IterableProperty<String>('existingWalletNames', existingWalletNames),
      );
  }
}
