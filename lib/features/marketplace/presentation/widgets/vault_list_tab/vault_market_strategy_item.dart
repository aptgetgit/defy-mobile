import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

import '../../../../../config/theme/colors.dart';


class VaultMarketStrategyItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconData;
  const VaultMarketStrategyItem({super.key, required this.title, required this.subtitle, required this.iconData});

  @override
  Widget build(BuildContext context) => Expanded(
        child: Row(
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                  color: AppColors.greyVeryLight,
                  borderRadius: BorderRadius.circular(60),
              ),
              child:  Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  iconData,
                  size: 24,
                  color: AppColors.greyDark,
                ),
              ),
            ),
            const Gap(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.greyDark,
                  ),
                ),
              ],
            ),
          ],
        ),
    );
}
