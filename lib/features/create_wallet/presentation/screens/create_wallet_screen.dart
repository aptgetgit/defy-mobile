import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/src/either.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/error/exception_with_stack_trace.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../core/navigation/routes/router.dart';
import '../../../../shared/blockchain/account/domain/entities/aptos_account_with_metadata.dart';
import '../../../../shared/blockchain/account/domain/usecases/list_aptos_account_usecase.dart';
import '../../../../shared/blockchain/account/presentation/providers/generate_account_flow_provider.dart';
import '../../../../shared/blockchain/account/presentation/providers/usecase_provider.dart';
import '../../../../shared/blockchain/account/presentation/states/generate_account_flow_state.dart';
import '../../../common/presentation/widgets/black_button.dart';
import '../../constants/create_wallet_ui_constants.dart';
import '../components/create_wallet_color_section.dart';
import '../components/create_wallet_emoji_section.dart';
import '../components/create_wallet_name_section.dart';
import '../providers/create_wallet_provider.dart';
import '../state/create_wallet_state.dart';
import '../widgets/create_wallet_card.dart';

class CreateWalletScreen extends StatefulHookConsumerWidget {
  const CreateWalletScreen({super.key, this.entropy});

  final Uint8List? entropy;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      CreateWalletScreenState();
}

class CreateWalletScreenState extends ConsumerState<CreateWalletScreen>
    with SingleTickerProviderStateMixin {
  late TextEditingController nameTextFieldController;
  late FocusNode nameTextFieldFocusNode;
  late AnimationController colorAnimationController;
  Set<String> existingWalletNames = <String>{};

  @override
  void initState() {
    super.initState();
    nameTextFieldController = TextEditingController(
      text: ref.read(createWalletNotifierProvider).accountName,
    );
    nameTextFieldFocusNode = FocusNode();
    colorAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    nameTextFieldFocusNode.requestFocus();
    Future<void>.microtask(_generateAccount);
    Future<void>.microtask(_initializeWalletNames);
  }

  Future<void> _initializeWalletNames() async {
    final ListAptosAccountsUseCase listAptosAccountUsecaseProvider =
        ref.read(listAptosAccountsUseCaseProvider);
    final Either<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>
        result = await listAptosAccountUsecaseProvider.call();
    final List<AptosAccountWithMetadata> accounts = result.fold(
      (ExceptionWithStackTrace failure) {
        AppLogger.error('Failed to fetch accounts: $failure');
        return <AptosAccountWithMetadata>[];
      },
      (Set<AptosAccountWithMetadata> accountSet) => accountSet.toList(),
    );

    existingWalletNames = accounts
        .map((AptosAccountWithMetadata account) => account.label)
        .toSet();
  }

  Future<void> _onTextChanged(String value) async {
    ref.read(createWalletNotifierProvider.notifier).updateWalletName(value);
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
                // Icon section
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

                // Title section
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

                // Content section
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

                // Button section
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

Future<void> _generateAccount() async {
  if (widget.entropy != null) {
    await ref.watch(generateAccountFlowProvider.notifier).generateAccount(
      AccountGenerationParams.generateFromEntropy(entropyHash: widget.entropy!, accountIndex: const Option<int>.none(),),
      );
  } else {
    await ref.watch(generateAccountFlowProvider.notifier).generateAccount(
      const AccountGenerationParams.generateMnemonic(strength: 128),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    final CreateWalletState createWalletState =
        ref.watch(createWalletNotifierProvider);
    final CreateWalletNotifier createWalletNotifier =
        ref.watch(createWalletNotifierProvider.notifier);
    final GenerateAccountFlowState accountFlowState =
        ref.watch(generateAccountFlowProvider);

    return Scaffold(
      appBar: _buildAppBar(
        context,
        createWalletState,
        createWalletNotifier,
      ),
      body: GestureDetector(
        onTap: nameTextFieldFocusNode.unfocus,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  _buildWalletNameSection(
                    createWalletState,
                    createWalletNotifier,
                  ),
                  _buildWalletColorSection(
                    createWalletState,
                    createWalletNotifier,
                  ),
                  _buildWalletCard(context, createWalletState),
                  _buildEmojiPickerSection(
                    createWalletState,
                    createWalletNotifier,
                  ),
                  if (accountFlowState is GenerateAccountFlowStateImporting)
                    const Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
            _buildBottomButton(createWalletState, createWalletNotifier),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    CreateWalletState state,
    CreateWalletNotifier notifier,
  ) =>
      AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if (state.currentStep > 0) {
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
        3,
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

  Widget _buildWalletNameSection(
    CreateWalletState state,
    CreateWalletNotifier notifier,
  ) =>
      _buildAnimatedSection(
        condition: state.currentStep == 0,
        child: CreateWalletNameSection(
          hasModifiedName: state.isWalletNameEntered,
          isEditing: state.currentStep == 0,
          createWalletState: state,
          createWalletNotifier: notifier,
        ),
      );

  Widget _buildWalletColorSection(
    CreateWalletState state,
    CreateWalletNotifier notifier,
  ) =>
      _buildAnimatedSection(
        condition: state.currentStep == 1,
        child: CreateWalletColorSection(
          animateSlider: (int index, LinearGradient color) {
            notifier
              ..updateSliderPosition(index.toDouble())
              ..updateColor(color)
              ..updateSelectedColorIndex(index);
          },
          createWalletNotifier: notifier,
          createWalletState: state,
        ),
      );

  Widget _buildEmojiPickerSection(
    CreateWalletState state,
    CreateWalletNotifier notifier,
  ) =>
      _buildAnimatedSection(
        condition: state.currentStep == 2,
        child: CreateWalletEmojiSection(
          createWalletNotifier: notifier,
          createWalletState: state,
        ),
      );

  Widget _buildWalletCard(BuildContext context, CreateWalletState state) =>
      CreateWalletCard(
        state: state,
        controller: nameTextFieldController,
        focusNode: nameTextFieldFocusNode,
        onTextChanged: _onTextChanged,
        context: context,
      );

  Widget _buildBottomButton(
    CreateWalletState state,
    CreateWalletNotifier notifier,
  ) =>
      BlackButtonXL(
        onClick: () async {
          if (existingWalletNames
              .contains(nameTextFieldController.text.trim())) {
            await _showDuplicateNameDialog(
              context,
            );
          } else if (state.currentStep < 2) {
            notifier.navigateToNextSection();
          } else {
            try {
              await notifier.generateAccount();
            } on Exception catch (e) {
              AppLogger.error(e.toString());
            } finally {
              if (mounted) {
                await const CreatedWalletScreenRoute().push<void>(context);
              }
            }
          }
        },
        title: 'Continue',
      );

  Widget _buildAnimatedSection({
    required bool condition,
    required Widget child,
  }) =>
      AnimatedOpacity(
        duration: CreateWalletConstants.animationDuration,
        curve: Curves.easeInOutCubic,
        opacity: condition ? 1.0 : 0.0,
        child: Visibility(visible: condition, child: child),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<FocusNode>(
          'nameTextFieldFocusNode',
          nameTextFieldFocusNode,
        ),
      )
      ..add(
        DiagnosticsProperty<TextEditingController>(
          'nameTextFieldController',
          nameTextFieldController,
        ),
      )
      ..add(
        DiagnosticsProperty<AnimationController>(
          'colorAnimationController',
          colorAnimationController,
        ),
      )
      ..add(
        IterableProperty<String>(
          'existingWalletNames',
          existingWalletNames,
        ),
      );
  }
}
