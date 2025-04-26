import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

class CategoryHeader extends StatelessWidget {

  const CategoryHeader(this.title, this.onTap, {super.key});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.only(left: 18.w, right: 18.w, bottom: 14.h, top: 22.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(PhosphorIcons.caretRight(), color: AppColors.blue, size: 18.sp),
              ],
            ),
          ),
        ],
      ),
    );
}
