import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../../shared/account/presentation/providers/generate_account_flow.dart';
import '../../../../shared/account/presentation/states/generate_account_flow_state.dart';
import '../../../common/presentation/widgets/black_button.dart';
import '../providers/import_wallet_provider.dart';
import '../state/import_wallet_state.dart';

class CreatedWalletScreen extends ConsumerStatefulWidget {
  const CreatedWalletScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreatedWalletScreenState();
}

class _CreatedWalletScreenState extends ConsumerState<CreatedWalletScreen>
    with SingleTickerProviderStateMixin {
  late ConfettiController _confettiController;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    Future<void>.delayed(const Duration(milliseconds: 300), () {
      _confettiController.play();
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  String _truncateAddress(String address) {
    if (address.length > 10) {
      return '${address.substring(0, 6)}...${address.substring(address.length - 4)}';
    }
    return address;
  }

  @override
  Widget build(BuildContext context) {
    final ImportWalletState state = ref.watch(importWalletNotifierProvider);
    final GenerateAccountFlowState accountFlowState =
        ref.watch(generateAccountFlowProvider);

    String walletAddress = 'Wallet Address';
    if (accountFlowState is GenerateAccountFlowStateReady) {
      walletAddress =
          _truncateAddress(accountFlowState.account.accountAddress.toHex());
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Created Wallet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: AppColors.greenLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                PhosphorIconsBold.check,
                size: 12,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: state.selectedWalletColor,
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/wallet-creation-wallet-background-wallet-component.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 110, top: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                state.accountName,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                walletAddress,
                                style: const TextStyle(
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
                const Spacer(),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (BuildContext context, Widget? child) =>
                      Transform.translate(
                    offset: Offset(0, 50 * (1 - _animationController.value)),
                    child: Opacity(
                      opacity: _animationController.value,
                      child: BlackButtonXL(
                        onClick: () {},
                        title: 'Continue',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Transform.scale(
              scale: 0.5,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirection: pi / 2,
                maxBlastForce: 5,
                minBlastForce: 1,
                emissionFrequency: 0.05,
                numberOfParticles: 50,
                gravity: 0.05,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
