// provider_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProviderItem extends StatelessWidget {

  const ProviderItem({
    super.key,
    required this.name,
    required this.percentage,
    required this.imagePath,
    this.isLocked = false,
    this.isLiquid = false,
    this.onTap,
  });
  final String name;
  final String percentage;
  final String imagePath;
  final bool isLocked;
  final bool isLiquid;
  final VoidCallback? onTap;

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
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  image: Image.asset(imagePath).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
                  ),
                  if (isLocked) ...<Widget>[
                    Text(
                      'Locked',
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                  ],
                  if (isLiquid) ...<Widget>[
                    Text(
                      'Liquid',
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                  ],
                ],
              ),
            ),
            Text(
              percentage,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
            ),
          ],
        ),
      ),
  );
}
