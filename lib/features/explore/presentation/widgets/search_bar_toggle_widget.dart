import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/theme/colors.dart';
import '../providers/explore_provider.dart';
import '../providers/explore_state.dart';

class SearchBarToggleWidget extends ConsumerWidget {
  final TextEditingController searchController;
  final ExploreState exploreState;

  const SearchBarToggleWidget({
    Key? key,
    required this.searchController,
    required this.exploreState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: <Widget>[
          // Search Bar
          Expanded(
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                color: const Color(0xfff4f4f6),
                borderRadius: BorderRadius.circular(58.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Gap(16.w),
                  Icon(
                    PhosphorIconsBold.magnifyingGlass,
                    color: AppColors.greyMedium,
                    size: 18.sp,
                  ),
                  Gap(8.w),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search or paste URL',
                        hintStyle: TextStyle(
                          color: AppColors.greyMedium,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    PhosphorIconsBold.cards,
                    color: AppColors.greyMedium,
                    size: 18.sp,
                  ),
                  Gap(16.w),
                ],
              ),
            ),
          ),

          // Custom Toggle Button with Label
          Gap(8.w),
          GestureDetector(
            onTap: () {
              ref.read(exploreNotifierProvider.notifier).toggleRocketMode();
            },
            child: Column(
              children: <Widget>[
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 46.w,
                  height: 26.h,
                  decoration: BoxDecoration(
                    color: exploreState.isToggled ? Colors.orange : AppColors.greyMedium,
                    borderRadius: BorderRadius.circular(50.r),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withAlpha(51),
                        spreadRadius: -2.r,
                        offset: Offset(0, 2.h),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Align(
                    alignment: exploreState.isToggled ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      width: 22.w,
                      height: 22.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Gap(2.h),
                Text(
                  '🚀 mode',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.orangeAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}