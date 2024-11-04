import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DashboardAppbar extends StatelessWidget {
  const DashboardAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: const CircleAvatar(
            child: Image(image: AssetImage("assets/images/aj_avatar.png")),
          ),
        ),
        const Gap(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
            Text(
              "Business",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),
            ),
              ],
            ),
            Text(
              "Switch",
              style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.blue),
            ),
          ],
        ),
        Expanded(child: Container()),
        Container(
          decoration: BoxDecoration(
              color: AppColors.greyVeryLight, borderRadius: BorderRadius.circular(45)),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Icon(
              PhosphorIcons.clockCounterClockwise(),
              color: AppColors.greyDark,
              size: 26,
            ),
          ),
        ),
        const Gap(18),
        Container(
          decoration: BoxDecoration(
              color: AppColors.greyVeryLight, borderRadius: BorderRadius.circular(45)),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Icon(
              PhosphorIcons.qrCode(),
              color: AppColors.greyDark,
              size: 26,
            ),
          ),
        ),
      ],
    );
  }
}
