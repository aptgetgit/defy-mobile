import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding: EdgeInsets.only(top: 26.h),
          child: GestureDetector(
            onTap: onBalanceTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  balanceOption,
                  style: TextStyle(
                    fontSize: 16.sp, 
                    color: AppColors.greyLight, 
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(4.w),
                Icon(
                  PhosphorIconsBold.caretDown, 
                  color: AppColors.greyLight, 
                  size: 10.sp,
                ),
              ],
            ),
          ),
        ),
        Gap(5.h),
        Text(
          r'$1,038.56',
          style: TextStyle(
            fontSize: 38.sp, 
            fontWeight: FontWeight.w600,
          ),
        ),
        Gap(16.h),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 233, 243, 236),
            borderRadius: BorderRadius.circular(33.r),
          ),
          width: 79.w,
          height: 28.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                PhosphorIconsBold.arrowUp, 
                color: Colors.green, 
                size: 14.sp,
              ),
              Text(
                '18.73%',
                style: TextStyle(
                  color: Colors.green, 
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        Gap(35.h),
      ],
    ),
  );
}
