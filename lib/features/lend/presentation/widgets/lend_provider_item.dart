// provider_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/theme/colors.dart';

class LendProviderItem extends StatelessWidget {
  final dynamic name;
  final dynamic percentage;
  final dynamic imagePath;
  final dynamic ltv;
  final VoidCallback? onTap;
  final bool isDisabled;

  const LendProviderItem({
    super.key,
    required this.name,
    required this.percentage,
    required this.imagePath,
    required this.ltv,
    this.onTap,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        child: Row(
          children: <Widget>[
            Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset(imagePath.toString()).image,
                  fit: BoxFit.cover,
                  opacity: isDisabled ? 0.5 : 1,
                ),
              ),
            ),
            Gap(12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500, 
                      fontSize: 18.sp,
                      color: isDisabled ? Colors.grey[700] : Colors.black,
                    ),
                  ),
                  Text(
                    ltv.toString(),
                    style: TextStyle(
                      color: isDisabled ? Colors.grey[400] : Colors.grey, 
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              percentage.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w600, 
                fontSize: 18.sp,
                color: isDisabled ? AppColors.greyLight : Colors.black,
              ),
            ),
          ],
        ),
      ),
  );
}
