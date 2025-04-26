import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

class TokenCardWidgets {
  static Widget buildHotEmojiCard({
    required ValueNotifier<int> currentPage,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyVeryLight2,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.orange.withOpacity(0.5),
                      Colors.orange.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'Hot Emoji 🔥',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.orange,
                  ),
                ),
              ),
              ValueListenableBuilder<int>(
                valueListenable: currentPage,
                builder: (context, page, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        width: page == index ? 10.w : 6.w,
                        height: page == index ? 10.h : 6.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: page == index ? Colors.orange : Colors.grey,
                        ),
                      );
                    }),
                  );
                },
              ),
            ],
          ),
          Gap(16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // First Earth Token
              Column(
                children: [
                  Icon(
                    Icons.language, // Placeholder for the Earth emoji
                    size: 50.sp,
                    color: Colors.blue,
                  ),
                  Gap(8.h),
                  Text(
                    'Earth',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(8.h),
                  Row(
                    children: [
                      Icon(
                        PhosphorIcons.caretUp(PhosphorIconsStyle.bold),
                        color: Colors.green,
                        size: 14.sp,
                      ),
                      Text(
                        '2.5%',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Second Earth Token
              Column(
                children: [
                  Icon(
                    Icons.language,
                    size: 50.sp,
                    color: Colors.blue,
                  ),
                  Gap(12.h),
                  Text(
                    'Earth',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(8.h),
                  Row(
                    children: [
                      Icon(
                        PhosphorIcons.caretUp(PhosphorIconsStyle.bold),
                        color: Colors.green,
                        size: 14.sp,
                      ),
                      Text(
                        '1.8%',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Third Earth Token
              Column(
                children: [
                  Icon(
                    Icons.language,
                    size: 50.sp,
                    color: Colors.blue,
                  ),
                  Gap(8.h),
                  Text(
                    'Earth',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(8.h),
                  Row(
                    children: [
                      Icon(
                        PhosphorIcons.caretDown(PhosphorIconsStyle.bold),
                        color: AppColors.red,
                        size: 14.sp,
                      ),
                      Text(
                        '3.1%',
                        style: TextStyle(
                          color: AppColors.red,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget buildHotWheelsCard({
    required ValueNotifier<int> currentPage,
  }) {
    // Implementation copied from original
    return Container(
      padding: EdgeInsets.all(16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyVeryLight2,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.red.withOpacity(0.5),
                      Colors.red.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'Hot Wheels 🏎️',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              ),
              ValueListenableBuilder<int>(
                valueListenable: currentPage,
                builder: (context, page, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        width: page == index ? 10.w : 6.w,
                        height: page == index ? 10.h : 6.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: page == index ? Colors.orange : Colors.grey,
                        ),
                      );
                    }),
                  );
                },
              ),
            ],
          ),
          Gap(16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // First Car Token
              Column(
                children: [
                  Icon(
                    PhosphorIcons.car(PhosphorIconsStyle.fill),
                    size: 50.sp,
                    color: Colors.red,
                  ),
                  Gap(8.h),
                  Text(
                    'F1 Racer',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(8.h),
                  Row(
                    children: [
                      Icon(
                        PhosphorIcons.caretUp(PhosphorIconsStyle.bold),
                        color: Colors.green,
                        size: 14.sp,
                      ),
                      Text(
                        '5.2%',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Second Car Token
              Column(
                children: [
                  Icon(
                    PhosphorIcons.jeep(PhosphorIconsStyle.fill),
                    size: 50.sp,
                    color: Colors.red,
                  ),
                  Gap(8.h),
                  Text(
                    'SUV',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(8.h),
                  Row(
                    children: [
                      Icon(
                        PhosphorIcons.caretDown(PhosphorIconsStyle.bold),
                        color: AppColors.red,
                        size: 14.sp,
                      ),
                      Text(
                        '1.7%',
                        style: TextStyle(
                          color: AppColors.red,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Third Car Token
              Column(
                children: [
                  Icon(
                    PhosphorIcons.truck(PhosphorIconsStyle.fill),
                    size: 50.sp,
                    color: Colors.red,
                  ),
                  Gap(8.h),
                  Text(
                    'Pickup',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(8.h),
                  Row(
                    children: [
                      Icon(
                        PhosphorIcons.caretUp(PhosphorIconsStyle.bold),
                        color: Colors.green,
                        size: 14.sp,
                      ),
                      Text(
                        '3.8%',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget buildNoobRacersCard({
    required ValueNotifier<int> currentPage,
  }) {
    // Implementation copied from original
    return Container(
      padding: EdgeInsets.all(16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyVeryLight2,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.blue.withOpacity(0.5),
                      Colors.blue.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'Noob Racers 🎮',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
              ),
              ValueListenableBuilder<int>(
                valueListenable: currentPage,
                builder: (context, page, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        width: page == index ? 10.w : 6.w,
                        height: page == index ? 10.h : 6.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: page == index ? Colors.orange : Colors.grey,
                        ),
                      );
                    }),
                  );
                },
              ),
            ],
          ),
          Gap(16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // First Game Token
              Column(
                children: [
                  Icon(
                    PhosphorIcons.gameController(PhosphorIconsStyle.fill),
                    size: 50.sp,
                    color: Colors.blue,
                  ),
                  Gap(8.h),
                  Text(
                    'RacerX',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(8.h),
                  Row(
                    children: [
                      Icon(
                        PhosphorIcons.caretUp(PhosphorIconsStyle.bold),
                        color: Colors.green,
                        size: 14.sp,
                      ),
                      Text(
                        '8.3%',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Second Game Token
              Column(
                children: [
                  Icon(
                    PhosphorIcons.joystick(PhosphorIconsStyle.fill),
                    size: 50.sp,
                    color: Colors.blue,
                  ),
                  Gap(8.h),
                  Text(
                    'NeedSpeed',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(8.h),
                  Row(
                    children: [
                      Icon(
                        PhosphorIcons.caretUp(PhosphorIconsStyle.bold),
                        color: Colors.green,
                        size: 14.sp,
                      ),
                      Text(
                        '6.1%',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Third Game Token
              Column(
                children: [
                  Icon(
                    PhosphorIcons.screencast(PhosphorIconsStyle.fill),
                    size: 50.sp,
                    color: Colors.blue,
                  ),
                  Gap(8.h),
                  Text(
                    'Kart Race',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(8.h),
                  Row(
                    children: [
                      Icon(
                        PhosphorIcons.caretDown(PhosphorIconsStyle.bold),
                        color: AppColors.red,
                        size: 14.sp,
                      ),
                      Text(
                        '2.4%',
                        style: TextStyle(
                          color: AppColors.red,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}