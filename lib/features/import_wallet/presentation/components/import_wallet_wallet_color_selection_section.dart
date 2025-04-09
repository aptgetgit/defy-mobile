

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../config/theme/colors.dart';
import '../constants/import_wallet_ui_constants.dart';
import '../providers/import_wallet_provider.dart';
import '../../../common/presentation/widgets/animated_color_button.dart';
import '../state/import_wallet_state.dart';

class WalletColorSection extends StatelessWidget {
  const WalletColorSection({
    required this.animateSlider,
    required this.importWalletNotifier,
    required this.importWalletState,
    super.key,
  });
  final void Function(int, LinearGradient) animateSlider;
  final ImportWalletNotifier importWalletNotifier;
  final ImportWalletState importWalletState;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'Choose a Color',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const Text(
              'Color your wallet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.greyLight,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0;
                    i < ImportWalletConstants.walletColors.length;
                    i++) ...<Widget>[
                  if (i > 0) const SizedBox(width: 20),
                  ColorButton(
                    color: ImportWalletConstants.walletColors[i],
                    index: i,
                    onTap: (int index) => animateSlider(
                      index,
                      ImportWalletConstants.walletColors[i],
                    ),
                    updateSliderPosition: importWalletNotifier.updateSliderPosition,
                    isSelected: importWalletState.walletColorSelectedIndex == i,
                  ),
                ],
              ],
            ),
          ],
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<void Function(int p1, LinearGradient p2)>.has(
          'animateSlider', animateSlider))
      ..add(DiagnosticsProperty<ImportWalletNotifier>(
          'importWalletNotifier', importWalletNotifier));
  }
}
