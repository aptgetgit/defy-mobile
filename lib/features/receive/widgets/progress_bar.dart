// widgets/progress_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/colors.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.currentPage,
    this.totalPages = 3,
  });

  final int currentPage;
  final int totalPages;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          totalPages,
          (int index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: (index + 1) == currentPage ? 64.w : 42.w,
            height: (index + 1) == currentPage ? 6.w : 4.w,
            margin: EdgeInsets.symmetric(horizontal: 1.w),
            decoration: BoxDecoration(
              color: index < currentPage ? AppColors.green : AppColors.greyVeryLight,
              borderRadius: BorderRadius.circular(40.r),
            ),
          ),
        ),
      );
}
