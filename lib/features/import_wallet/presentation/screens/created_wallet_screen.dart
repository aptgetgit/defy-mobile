import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

import '../../../../core/navigation/routes/router.dart';
import '../../../../shared/blockchain/account/presentation/providers/generate_account_flow_provider.dart';
import '../../../../shared/blockchain/account/presentation/states/generate_account_flow_state.dart';
import '../../../common/presentation/widgets/black_button.dart';
import '../components/wallet_card_back.dart';
import '../providers/import_wallet_provider.dart';
import '../state/import_wallet_state.dart';

class CreatedWalletScreen extends ConsumerStatefulWidget {
  const CreatedWalletScreen({super.key});

  @override
  ConsumerState<CreatedWalletScreen> createState() =>
      _CreatedWalletScreenState();
}

class _CreatedWalletScreenState extends ConsumerState<CreatedWalletScreen>
    with SingleTickerProviderStateMixin {
  late ConfettiController _confettiController;
  late AnimationController _animationController;
  bool _isFrontCard = true;
  bool _isFlipping = true;
  late Timer _flipTimer;
  int _flipCount = 0;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _flipTimer =
        Timer.periodic(const Duration(milliseconds: 1000), (Timer timer) {
      if (_flipCount < 3) {
        setState(() {
          _isFrontCard = !_isFrontCard;
          _flipCount++;
        });
      } else {
        _flipTimer.cancel();
        setState(() {
          _isFlipping = false;
          _isFrontCard = true;
        });
        _animationController.forward();
      }
    });

    _animationController.addListener(() {
      if (_animationController.value >= 1) {
        _confettiController.play();
      }
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _animationController.dispose();
    _flipTimer.cancel();
    super.dispose();
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
        automaticallyImplyLeading: false,
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
          TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: MediaQuery.of(context).size.height / 4,
              end: _isFlipping ? MediaQuery.of(context).size.height / 4 : 20,
            ),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            builder: (BuildContext context, double value, Widget? child) =>
                Positioned(
              top: value,
              left: 20,
              right: 20,
              child: FlipCard(
                toggler: _isFrontCard,
                frontCard: _buildWalletCard(state, walletAddress),
                backCard: const WalletCardBack(),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: AnimatedOpacity(
              opacity: !_isFlipping ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: BlackButtonXL(
                onClick: () {
                  const ChooseWalletUserScreenRoute().go(context);
                },
                title: 'Continue',
              ),
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

  String _truncateAddress(String address) {
    if (address.length > 10) {
      return '${address.substring(0, 6)}...${address.substring(address.length - 4)}';
    }
    return address;
  }

  Widget _buildWalletCard(ImportWalletState state, String walletAddress) =>
      Container(
        height: 200,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(
              'assets/images/wallet-creation-wallet-background-wallet-component.png',
            ),
            fit: BoxFit.cover,
          ),
          gradient: state.selectedWalletColor,
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
      );
}
