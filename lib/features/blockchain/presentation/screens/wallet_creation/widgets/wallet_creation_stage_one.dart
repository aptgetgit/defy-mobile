import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/blockchain/presentation/providers/account/dashboard_ui_provider.dart';
import 'package:defy/features/blockchain/presentation/providers/account/new_wallet_data_provider.dart';
import 'package:defy/features/blockchain/presentation/providers/states/creation_stage_controller.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/card_customization_widget.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/confirm_button.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/wallet_creation_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WalletCreationStageOne extends ConsumerStatefulWidget {
  const WalletCreationStageOne({super.key});

  @override
  ConsumerState<WalletCreationStageOne> createState() =>
      _WalletCreationStageOneState();
}

class _WalletCreationStageOneState
    extends ConsumerState<WalletCreationStageOne> {
  bool buttonActive = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: WalletCreationAppBar(index: 1),
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Container(
              height : context.screenHeight -
                55 -
                MediaQuery.of(context).padding.top,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => setState(() {}),
                    child: Text(
                      'Let’s Create your new Wallet 🥳',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Gap(18),
                  Row(children: [
                    const Icon(PhosphorIconsBold.identificationCard),
                    const Gap(5),
                    Text(
                      'Give a name',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ]),
                  const Gap(6),
                  Text(
                    'Give a name to your new wallet ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyLight),
                  ),
                  const Gap(50),
                  const CardCustomizationWidget(disableAnimation: false),
                  const Spacer(),
                  ConfirmButton(
                    isActive: buttonActive,
                    onTap: () async {
                      context.unfocus();
                      await Future.delayed(1.seconds);
                      if (!buttonActive) return;
                      final walletCreationStageCtr =
                          ref.read(walletCreationStageProvider.notifier);
                      final walletTextController = ref.read(walletCreationTextControllerProvider);
                      ref
                          .read(newWalletDataStateProvider.notifier)
                          .setName(walletTextController.text);
                      await walletCreationStageCtr
                          .jumpToStage(CreationStage.stageTwo);
                    },
                  ),
                  const Gap(24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
