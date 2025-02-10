import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VaultConstituentItem extends StatelessWidget {
  const VaultConstituentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: AppColors.greyVeryLight,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 10),
        child: Row(
          children: [
            const Image(
              height: 24,
              width: 24,
              fit: BoxFit.cover,
              image: AssetImage("assets/images/Doge-Circle.png"),
            ),
            const Gap(12),
            Text(
              "SHIBA INU",
              style: TextStyle(
                color: AppColors.greyDark,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Text(
              "16.52%",
              style: TextStyle(
                color: AppColors.greyDark,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(12),
            const Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: Icon(
                PhosphorIconsFill.caretUp,
                size: 22,
                color: AppColors.textGreen,
              ),
            ),
            const Gap(2),
            Text(
              "2.12%",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.textGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}