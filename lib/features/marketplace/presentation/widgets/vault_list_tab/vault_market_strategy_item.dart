import 'package:defy/config/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';


class VaultMarketStrategyItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconData;
  const VaultMarketStrategyItem({super.key, required this.title, required this.subtitle, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.greyVeryLight,
                  borderRadius: BorderRadius.circular(60)
              ),
              child:  Padding(
                padding: EdgeInsets.all(12.0),
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
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.greyDark
                  ),
                ),
              ],
            )
          ],
        )
    )
    ;
  }
}
