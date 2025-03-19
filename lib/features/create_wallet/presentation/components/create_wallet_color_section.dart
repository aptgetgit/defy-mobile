

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../config/theme/colors.dart';
import '../../../common/presentation/widgets/animated_color_button.dart';
import '../../constants/create_wallet_ui_constants.dart';
import '../providers/create_wallet_provider.dart';
import '../state/create_wallet_state.dart';

class CreateWalletColorSection extends StatelessWidget {
  const CreateWalletColorSection({
    required this.animateSlider,
    required this.createWalletNotifier,
    required this.createWalletState,
    super.key,
  });
  final void Function(int, Color) animateSlider;
  final CreateWalletNotifier createWalletNotifier;
  final CreateWalletState createWalletState;

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
                    i < CreateWalletConstants.walletColors.length;
                    i++) ...<Widget>[
                  if (i > 0) const SizedBox(width: 20),
                  ColorButton(
                    color: CreateWalletConstants.walletColors[i],
                    index: i,
                    onTap: (int index) => animateSlider(
                      index,
                      CreateWalletConstants.walletColors[i],
                    ),
                    updateSliderPosition: createWalletNotifier.updateSliderPosition,
                    isSelected: createWalletState.walletColorSelectedIndex == i,
                    
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
      ..add(ObjectFlagProperty<void Function(int p1, Color p2)>.has(
          'animateSlider', animateSlider))
      ..add(DiagnosticsProperty<CreateWalletNotifier>(
          'createWalletNotifier', createWalletNotifier));
  }
}
