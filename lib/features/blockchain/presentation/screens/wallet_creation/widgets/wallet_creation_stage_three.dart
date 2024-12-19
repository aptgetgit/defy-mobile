// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:math';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/blockchain/presentation/providers/account/new_wallet_data_provider.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/card_customization_widget.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/confirm_button.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/wallet_card_back.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/wallet_creation_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:confetti/confetti.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

final cardZoomedProvider = StateProvider.autoDispose<bool>((ref) => false);

class WalletCreationStageThree extends ConsumerStatefulWidget {
  const WalletCreationStageThree({super.key});

  @override
  ConsumerState<WalletCreationStageThree> createState() =>
      _WalletCreationStageThreeState();
}

class _WalletCreationStageThreeState
    extends ConsumerState<WalletCreationStageThree> with SingleTickerProviderStateMixin{
  bool loading = true;
  bool isFrontCard = true;
  bool showConfetti = true;
  late Timer timer;
  final confetti = ConfettiController();

      late AnimationController controller;
  late Animation sizeAnimation;


  bool twoFactorAuthVerified = false;

  @override
  void initState() {
    super.initState();
     controller =  AnimationController(vsync: this, duration: Duration(seconds: 2));
 sizeAnimation = Tween<double>(begin: 1, end: 1.4).animate(controller);
    timer = Timer.periodic(
      1000.milliseconds,
      (v) => setState(() => isFrontCard = !isFrontCard),
    );
    init();
  }

  @override
  void dispose() {
    confetti.dispose();
    timer.cancel();
    super.dispose();
  }

  Future<void> playConfitti() async {
    confetti.play();
    await Future.delayed(2.seconds);
    confetti.stop();
    setState(() => showConfetti = false);
  }

  Future<void> init() async {
    await Future.delayed(1.seconds);
    // await ref.read(newWalletDataStateProvider.notifier).createWallet();
    await Future.delayed(1400.milliseconds);
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    final _ = ref.watch(newWalletDataStateProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: WalletCreationAppBar(
          index: 3,
          walletCreated: !loading,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 25,
        ).copyWith(top: 10),
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Visibility(
              visible: loading,
              child: Text(
                'Creating Keyless Wallet 😇',
                style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600),
              ),
            ),
            Visibility(
              visible: loading,
              replacement: TweenAnimationBuilder(
                  tween: Tween<double>(begin: width * .4, end: 0),
                  duration: 500.milliseconds,
                  builder: (context, value, child) {
                    if (value == 0) playConfitti();
                    return Gap(value);
                  }),
              child: Column(
                children: [
                  Gap(width * 0.4),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(20),
                Stack(
                  children: [
                    FlipCard(
                      toggler: isFrontCard || !loading,
                      frontCard:
                        const CardCustomizationWidget(disableAnimation: true),
                      backCard: const WalletCardBack(),
                    ),
                    if (showConfetti)
                      Container(
                        alignment: Alignment.center,
                        child: ConfettiWidget(
                          confettiController: confetti,
                          blastDirectionality: BlastDirectionality.explosive,
                          gravity: 0.4,
                          numberOfParticles: 60,
                        ),
                      ),
                  ],
                ),
                const Gap(20),
                Text(
                  loading
                      ? 'Hold on ! your personalised  wallet\nis being created ...'
                      : 'This wallet is added to your pofile',
                  style: TextStyle(fontSize: 16,fontWeight:FontWeight.w500,color: AppColors.greyDark),
                  textAlign: TextAlign.center,
                ).animate().scale(duration: 1.seconds)
              ],
            ),
            if (!loading) const Spacer(),
            Visibility(
              visible: !loading,
              child: Align(
                alignment: Alignment.center,
                child: Visibility(
                  visible: twoFactorAuthVerified,
                  replacement: GestureDetector(
                    onTap: () async {
                      twoFactorAuthVerified = true;
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          PhosphorIconsBold.key,
                          color: colorFromHex('#1667e5'),
                          size: 20,
                        ),
                        const Gap(5),
                        Text(
                          'Enable 2-FA now',
                        ),
                      ],
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (ctx) {
                      //     return const SeedCloudBackupScreen("id", "seed");
                      //   }),
                      // );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          PhosphorIconsFill.checkCircle,
                          color: Colors.green,
                          size: 20,
                        ),
                        const Gap(5),
                        Text(
                          'Enabled 2FA',
                        ),
                      ],
                    ),
                  ),
                ),
              ).animate().fade(),
            ),
            const Gap(20),
            Visibility(
              visible: loading,
              replacement: ConfirmButton(
                onTap: () async {
                  // await ref.read(accountCoreProvider.notifier).refresh();
                },
              ),
              child: const Gap(50),
            ),
          ],
        ),
      ),
    );
  }
}

class FlipCard extends StatelessWidget {
  final bool toggler;
  final Widget frontCard;
  final Widget backCard;

  const FlipCard({
    super.key,
    required this.toggler,
    required this.backCard,
    required this.frontCard,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: _transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        switchInCurve: Curves.ease,
        switchOutCurve: Curves.ease.flipped,
        child: toggler
            ? SizedBox(key: const ValueKey('front'), child: frontCard)
            : SizedBox(key: const ValueKey('back'), child: backCard),
      ),
    );
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnimation = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnimation,
      child: widget,
      builder: (context, widget) {
        final isFront = ValueKey(toggler) == widget!.key;
        final rotationY = isFront
            ? rotateAnimation.value
            : min(rotateAnimation.value, pi * 0.5);
        return Transform(
          transform: Matrix4.rotationY(rotationY)..setEntry(3, 0, 0),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }
}
