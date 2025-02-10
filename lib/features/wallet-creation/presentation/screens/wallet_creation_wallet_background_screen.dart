import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../../config/theme/colors.dart';
import '../provider/wallet_creation_wallet_background_provider.dart';
import '../state/wallet_creation_wallet_background_state.dart';

class WalletCreationWalletBackgroundScreen extends ConsumerStatefulWidget {
  const WalletCreationWalletBackgroundScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      WalletCreationWalletBackgroundScreenState();
}

class WalletCreationWalletBackgroundScreenState
    extends ConsumerState<WalletCreationWalletBackgroundScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _colorAnimation = ColorTween(
      begin: AppColors.blue,
      end: AppColors.blue,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateSlider(int index, Color newColor) {
    final Color previousColor =
        ref.read(walletBackgroundProvider).selectedColor;

    // Update the animation color and index
    _colorAnimation = ColorTween(
      begin: previousColor,
      end: newColor,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    ref
        .read(walletBackgroundProvider.notifier)
        .updateSliderPosition(index.toDouble());
    ref.read(walletBackgroundProvider.notifier).updateColor(newColor);
    ref.read(walletBackgroundProvider.notifier).updateSelectedIndex(index);

    _controller.forward(from: 0); // Restart the animation
  }

  @override
  Widget build(BuildContext context) {
    final WalletBackgroundState state = ref.watch(walletBackgroundProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(PhosphorIconsBold.caretLeft),
            ),
            const Spacer(),
            const Spacer(),
            Image.asset(
              'assets/images/wallet-creation-wallet-background-appbar-component.png',
              height: 100,
              width: 140,
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyMedium),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/icons/coins.png',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Coins',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyDark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Let's create your new Wallet 🥳",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Row(
              children: <Widget>[
                Icon(
                  PhosphorIconsRegular.palette,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Select Background',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              'Choose the colour of your wallet, you can edit this anytime.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.greyLight,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: state.selectedColor,
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/wallet-creation-wallet-background-wallet-component.png',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 110, top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Business',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                        Text(
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
            const Spacer(),
            const SizedBox(height: 20),
            Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _ColorButton(
                      color: AppColors.blue,
                      index: 0,
                      onTap: (int index) =>
                          _animateSlider(index, AppColors.blue),
                    ),
                    const SizedBox(width: 20),
                    _ColorButton(
                      color: AppColors.greenLight,
                      index: 1,
                      onTap: (int index) =>
                          _animateSlider(index, AppColors.greenLight),
                    ),
                    const SizedBox(width: 20),
                    _ColorButton(
                      color: AppColors.orange,
                      index: 2,
                      onTap: (int index) =>
                          _animateSlider(index, AppColors.orange),
                    ),
                    const SizedBox(width: 20),
                    _ColorButton(
                      color: AppColors.yellow,
                      index: 3,
                      onTap: (int index) =>
                          _animateSlider(index, AppColors.yellow),
                    ),
                    const SizedBox(width: 20),
                    _ColorButton(
                      color: AppColors.pink,
                      index: 4,
                      onTap: (int index) =>
                          _animateSlider(index, AppColors.pink),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(40),
              ),
              height: 54,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorButton extends ConsumerWidget {
  final Color color;
  final int index;
  final Function(int) onTap;

  const _ColorButton({
    required this.color,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WalletBackgroundState state = ref.watch(walletBackgroundProvider);
    final isSelected = state.selectedIndex == index;

    return GestureDetector(
      onTap: () {
        ref
            .read(walletBackgroundProvider.notifier)
            .updateSliderPosition(index.toDouble());
        onTap(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: isSelected ? 40 : 32,
        width: isSelected ? 40 : 32,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.6),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
      ),
    );
  }
}
