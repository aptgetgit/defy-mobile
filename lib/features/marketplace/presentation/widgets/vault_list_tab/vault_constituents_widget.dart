import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'vault_constituent_item.dart';

class VaultConstituentsWidget extends StatelessWidget {
  const VaultConstituentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Constituents",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            children: [
              Text(
                "NAME",
                style: TextStyle(
                  color: AppColors.greyLight,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                "HOLDINGS",
                style: TextStyle(
                  color: AppColors.greyLight,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap(14),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          "1W",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Gap(4),
                        const Icon(
                          PhosphorIconsBold.caretLeft,
                          size: 14,
                          color: AppColors.white,
                        ),
                        const Icon(
                          PhosphorIconsBold.caretRight,
                          size: 14,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const VaultConstituentItem(),
        const VaultConstituentItem(),
        const VaultConstituentItem(),
        const VaultConstituentItem(),
      ],
    );
  }
}