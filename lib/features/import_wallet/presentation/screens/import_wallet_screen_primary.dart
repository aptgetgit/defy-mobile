import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/src/either.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/constants/animated_emoji.dart';
import '../../../../core/constants/bip39_wordlist.dart';
import '../../../../core/error/exception_with_stack_trace.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../core/navigation/routes/router.dart';
import '../../../../core/utils/emoji_utils.dart';
import '../../../../shared/blockchain/account/domain/entities/aptos_account_with_metadata.dart';
import '../../../../shared/blockchain/account/domain/usecases/list_aptos_account_usecase.dart';
import '../../../../shared/blockchain/account/presentation/providers/generate_account_flow_provider.dart';
import '../../../../shared/blockchain/account/presentation/providers/usecase_provider.dart';
import '../../../../shared/blockchain/account/presentation/states/generate_account_flow_state.dart';
import '../../../common/presentation/widgets/black_button.dart';
import '../components/import_wallet_account_name_section.dart';
import '../components/import_wallet_emoji_selection_section.dart';
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

    super.dispose();
  }

  void _handleStateChangesOutsideBuild(WidgetRef ref, BuildContext context) {
    final GenerateAccountFlowState accountFlowState =
        ref.read(generateAccountFlowProvider);
    final ImportWalletNotifier importWalletNotifier =
        ref.read(importWalletNotifierProvider.notifier);

    if (accountFlowState is GenerateAccountFlowStateError) {
      _showErrorSnackBar(context, accountFlowState.message);
    } else if (accountFlowState is GenerateAccountFlowStateWaitingForMetadata) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        importWalletNotifier.updateShowWalletName();
      });
    } else if (accountFlowState is GenerateAccountFlowStateReady) {
      _handleAccountGenerated(context, accountFlowState);
    }
  }

  void _handleStateChanges(
    BuildContext context,
    GenerateAccountFlowState state,
  ) {
    if (state is GenerateAccountFlowStateError) {
      _showErrorSnackBar(context, state.message);
    } else if (state is GenerateAccountFlowStateWaitingForMetadata) {
      shouldRequestFocus.value = true;
    } else if (state is GenerateAccountFlowStateReady) {
      _handleAccountGenerated(context, state);
    }

    if (shouldRequestFocus.value) {
      nameTextFieldFocusNode.requestFocus();
      shouldRequestFocus.value = false;
    }
  }

  void _animateSlider(int index, Color newColor) {
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
        ref.read(importWalletNotifierProvider.notifier);
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
        canPop: !(importWalletState.showEmojiPicker ||
            importWalletState.showWalletColor ||
            importWalletState.showWalletName),
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }
          importWalletNotifier.navigateToPreviousSection();
        },
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
                    _buildWalletCard(context, importWalletState),
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

  Widget _buildSeedPhraseSection(
    ImportWalletState state,
    ImportWalletNotifier notifier,
  ) =>
      _buildAnimatedSection(
        condition: !(state.showWalletName ||
            state.showWalletColor ||
            state.showEmojiPicker),
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
        condition: state.showWalletName,
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
        condition: state.showWalletColor,
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
        condition: state.showEmojiPicker,
        child: WalletEmojiSection(
          importWalletNotifier: notifier,
          importWalletState: state,
        ),
      );

  Widget _buildWalletCard(BuildContext context, ImportWalletState state) =>
      WalletCard(
        state: state,
        controller: nameTextFieldController,
        focusNode: nameTextFieldFocusNode,
        onTextChanged: _onTextChanged,
        context: context,
      );

  Widget _buildBottomButton(
    ImportWalletState state,
    ImportWalletNotifier notifier,
  ) =>
      BlackButtonXL(
        onClick: () async {
          if (state.words.isEmpty) {
            AppLogger.debug(
                'State words are empty, attempting to paste from clipboard.');
            await _pasteFromClipboard(context, notifier);
          } 

          if (state.words.isEmpty) {
            AppLogger.debug(
                'State words are empty, attempting to paste from clipboard.');
            await _pasteFromClipboard(context, notifier);
          } else if (state.showWalletColor || state.showEmojiPicker) {
            AppLogger.debug(
                'Navigating to the next section: showWalletColor or showEmojiPicker is true.');
            await notifier.navigateToNextSection();
          } else if (state.showWalletName) {
            AppLogger.debug('Checking for duplicate wallet names.');
            if (existingWalletNames
                .contains(nameTextFieldController.text.trim())) {
              AppLogger.debug(
                  'Duplicate wallet name found, showing duplicate name dialog.');
              await _showDuplicateNameDialog(context);
            } else {
              AppLogger.debug(
                  'No duplicate wallet name found, navigating to the next section.');
              await notifier.navigateToNextSection();
            }
          } else {
            AppLogger.debug('Importing mnemonic.');
            await notifier.importMnemonic();
          }
        },
        title: state.words.isEmpty ? 'Paste from Clipboard' : 'Continue',
      );

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

  void _handleAccountGenerated(
    BuildContext context,
    GenerateAccountFlowStateReady state,
  ) {
    AppLogger.debug('Account generated successfully');
    AppLogger.debug('Account ID: ${state.account}');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      const CreatedWalletScreenRoute().go(context);
    });
  }

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
              child: const Icon(PhosphorIconsBold.caretLeft),
            ),
            const Spacer(),
            ..._buildProgressIndicators(state.currentStep),
            const Spacer(),
            _buildCoinIndicator(),
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

  Widget _buildCoinIndicator() => Container(
        padding: const EdgeInsets.only(top: 4, bottom: 4, right: 12, left: 4),
        decoration: BoxDecoration(
          color: AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Row(
          children: <Widget>[
            Image.asset('assets/icons/coin-yellow.png', width: 16, height: 16),
            const SizedBox(width: 8),
            const Text(
              '20',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.greyDark,
              ),
            ),
          ],
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

class WalletCard extends StatelessWidget {
  const WalletCard({
    required this.state,
    required this.controller,
    required this.focusNode,
    required this.onTextChanged,
    required this.context,
    super.key,
  });
  final ImportWalletState state;
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String) onTextChanged;
  final BuildContext context;

  @override
  Widget build(BuildContext context) => AnimatedPositioned(
        curve: Curves.easeInOutCubic,
        duration: ImportWalletConstants.positionAnimationDuration,
        right: _calculateWalletCardPosition(),
        left: state.showWalletColor || state.showEmojiPicker ? 0 : null,
        top: focusNode.hasFocus ? 110 : 200,
        child: Center(
          child: Container(
            height: ImportWalletConstants.cardHeight,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              color: state.selectedWalletColor,
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/wallet-creation-wallet-background-wallet-component.png',
                ),
                fit: BoxFit.cover,
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: AppColors.greyDark.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius:
                  BorderRadius.circular(ImportWalletConstants.borderRadius),
            ),
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  top: 30,
                  left: 34,
                  child: getAnimatedEmoji(state.selectedEmojiIndex),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: 110,
                  top: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        child: TextField(
                          enabled: state.showWalletName,
                          cursorHeight: 16,
                          cursorWidth: 1,
                          cursorColor: AppColors.white,
                          controller: controller,
                          focusNode: focusNode,
                          onChanged: onTextChanged,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      const Text(
                        'Wallet Address',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  double _calculateWalletCardPosition() {
    if (state.showWalletName) {
      return -MediaQuery.of(context).size.width / 4;
    }
    if (state.showWalletColor) {
      return 0;
    }
    if (state.showEmojiPicker) {
      return -MediaQuery.of(context).size.width / 2;
    }
    return -MediaQuery.of(context).size.width;
  }

  Widget getAnimatedEmoji(int index) {
    final AnimatedEmoji? emoji = EmojiUtils.getEmojiByIndex(index);
    if (emoji == null) {
      return const SizedBox.shrink();
    }

    return CachedNetworkImage(
      imageUrl: emoji.getEmoji,
      height: 40,
      width: 40,
      key: ValueKey<String>('emoji_${emoji.name}'),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<ImportWalletState>('state', state))
      ..add(
        DiagnosticsProperty<TextEditingController>('controller', controller),
      )
      ..add(DiagnosticsProperty<FocusNode>('focusNode', focusNode))
      ..add(
        ObjectFlagProperty<void Function(String p1)>.has(
          'onTextChanged',
          onTextChanged,
        ),
      )
      ..add(DiagnosticsProperty<BuildContext>('context', context));
  }
}
