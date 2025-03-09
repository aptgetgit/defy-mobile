import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../../config/theme/colors.dart';

class WalletHeader extends StatelessWidget {

  const WalletHeader({
    super.key,
    required this.opacity,
    required this.balanceOption,
    required this.onBalanceTap,
  });
  final double opacity;
  final String balanceOption;
  final VoidCallback onBalanceTap;

  @override
  Widget build(BuildContext context) => AnimatedOpacity(
    duration: const Duration(milliseconds: 200),
    opacity: opacity,
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 26),
          child: GestureDetector(
            onTap: onBalanceTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  balanceOption,
                  style: const TextStyle(fontSize: 16, color: AppColors.greyLight, fontWeight: FontWeight.w500),
                ),
                const Gap(4),
                const Icon(PhosphorIconsBold.caretDown, color: AppColors.greyLight, size: 10),
              ],
            ),
          ),
        ),
        const Gap(5),
        const Text(
          r'$1,038.56',
          style: TextStyle(fontSize: 38, fontWeight: FontWeight.w600),
        ),
        const Gap(16),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 233, 243, 236),
            borderRadius: BorderRadius.circular(33),
          ),
          width: 79,
          height: 28,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(PhosphorIconsBold.arrowUp, color: Colors.green, size: 14),
              Text(
                '18.73%',
                style: TextStyle(color: Colors.green, fontSize: 14),
              ),
            ],
          ),
        ),
        const Gap(35),
      ],
    ),
  );
}
