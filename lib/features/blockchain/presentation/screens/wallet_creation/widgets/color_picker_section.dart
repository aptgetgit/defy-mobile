import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/blockchain/presentation/providers/account/new_wallet_data_provider.dart';
import 'package:defy/features/blockchain/presentation/providers/states/card_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorPickerSection extends ConsumerWidget {
  const ColorPickerSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardColor = ref.watch(
      newWalletDataStateProvider.select((value) => value.cardColor),
    );
    final index = cardColor.index;

    double getSize(int pos) {
      int abs = index - pos;
      abs = abs < 0 ? -abs : abs;
      return (32 - (abs * 4)) / 2;
    }

    final defaultColors = [
      colorFromHex('#1667e5'), // Blue
      colorFromHex('#58BB47'), // Green
      colorFromHex('#FFAD29'), // Orange
      colorFromHex('#F0B90B'), // Yellow
      colorFromHex('#FA7AA2'), // Pink
    ];

    return Container(
      height: 100,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < defaultColors.length; i++)
            GestureDetector(
              onTap: () => ref
                  .read(newWalletDataStateProvider.notifier)
                  .setCardColor(
                      CardColor(index: i + 1, color: defaultColors[i]!)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: CircleAvatar(
                  radius: getSize(i + 1) + 4,
                  backgroundColor: index == i + 1
                      ? defaultColors.elementAt(i)
                      : AppColors.transparent,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: getSize(i + 1) + 2,
                    child: CircleAvatar(
                      backgroundColor: defaultColors.elementAt(i),
                      radius: getSize(i + 1),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
