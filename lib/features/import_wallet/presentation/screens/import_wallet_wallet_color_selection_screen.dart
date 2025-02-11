import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../common/presentation/widgets/black_button.dart';
import '../providers/import_wallet_provider.dart';
import '../state/import_wallet_state.dart';

class ImportWalletWalletColorSelectionScreen extends ConsumerStatefulWidget {
  const ImportWalletWalletColorSelectionScreen({
    required this.onContinue,
    super.key,
  });
  final VoidCallback onContinue;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ImportWalletWalletColorSelectionScreenState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(ObjectFlagProperty<VoidCallback>.has('onContinue', onContinue));
  }
}

class _ImportWalletWalletColorSelectionScreenState
    extends ConsumerState<ImportWalletWalletColorSelectionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateSlider(int index, Color newColor) {
    // Update the animation color and index

    ref
        .read(importWalletNotifierProvider.notifier)
        .updateSliderPosition(index.toDouble());
    ref.read(importWalletNotifierProvider.notifier).updateColor(newColor);
    ref.read(importWalletNotifierProvider.notifier).updateSelectedIndex(index);

    _controller.forward(from: 0); // Restart the animation
  }

  @override
  Widget build(BuildContext context) {
    final ImportWalletState state = ref.watch(importWalletNotifierProvider);
    return Scaffold(
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
            const Spacer(),
            const SizedBox(height: 20),
            Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ColorButton(
                      color: AppColors.blue,
                      index: 0,
                      onTap: (int index) =>
                          _animateSlider(index, AppColors.blue),
                    ),
                    const SizedBox(width: 20),
                    ColorButton(
                      color: AppColors.greenLight,
                      index: 1,
                      onTap: (int index) =>
                          _animateSlider(index, AppColors.greenLight),
                    ),
                    const SizedBox(width: 20),
                    ColorButton(
                      color: AppColors.orange,
                      index: 2,
                      onTap: (int index) =>
                          _animateSlider(index, AppColors.orange),
                    ),
                    const SizedBox(width: 20),
                    ColorButton(
                      color: AppColors.yellow,
                      index: 3,
                      onTap: (int index) =>
                          _animateSlider(index, AppColors.yellow),
                    ),
                    const SizedBox(width: 20),
                    ColorButton(
                      color: AppColors.pink,
                      index: 4,
                      onTap: (int index) =>
                          _animateSlider(index, AppColors.pink),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: BlackButtonXL(
                onClick: widget.onContinue,
                title: 'Confirm',
                horizontalPadding: false,
              ).animate().scale(),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorButton extends ConsumerWidget {
  const ColorButton({
    required this.color,
    required this.index,
    required this.onTap,
    super.key,
  });
  final Color color;
  final int index;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ImportWalletState state = ref.watch(importWalletNotifierProvider);
    final bool isSelected = state.walletColorSelectedIndex == index;

    return GestureDetector(
      onTap: () {
        ref
            .read(importWalletNotifierProvider.notifier)
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
              ? <BoxShadow>[
                  BoxShadow(
                    color: color.withValues(alpha: 0.6),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ]
              : <BoxShadow>[],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('color', color))
      ..add(IntProperty('index', index))
      ..add(ObjectFlagProperty<void Function(int p1)>.has('onTap', onTap));
  }
}
