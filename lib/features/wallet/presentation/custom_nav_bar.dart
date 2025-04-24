import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';


import '../../../config/theme/colors.dart';
import '../../shared/presentation/dashboard-floating-action-button.dart';

class CustomNavBar extends ConsumerWidget {
  const CustomNavBar({
    super.key,
    required this.pageIndex,
    required this.onTabChange,
    required this.isMoreOptionsSelected,
    required this.onHidePressed,
    required this.onSortPressed,
    required this.onWatchlistPressed,
  });

  final int pageIndex;
  final Function(int) onTabChange;
  final bool isMoreOptionsSelected;
  final VoidCallback onHidePressed;
  final VoidCallback onSortPressed;
  final VoidCallback onWatchlistPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
      color: Colors.transparent,
      height: 97.h,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: !isMoreOptionsSelected ? 0.6.sw : 0.7.sw,
          child: Stack(
            children: <Widget>[
              // Nav bar container
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: isMoreOptionsSelected ? 100.h : 90.h,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: isMoreOptionsSelected
                      ? BorderRadius.circular(24.r)
                      : BorderRadius.circular(64.r),
                ),
                margin: EdgeInsets.only(top: 18.h, bottom: 18.h),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      // Default navigation buttons (fade out when more options selected)
                      AnimatedOpacity(
                        opacity: !isMoreOptionsSelected ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                                minimumSize: Size(60.w, 60.h),
                                shape: CircleBorder(),
                              ),
                              onPressed: !isMoreOptionsSelected 
                                ? () {
                                    print("DIRECT: Tab 1 pressed"); // Debug print
                                    onTabChange(1); // Explore tab index
                                  } 
                                : null,
                              child: Icon(
                                pageIndex == 1
                                    ? PhosphorIconsFill.magnifyingGlass
                                    : PhosphorIconsBold.magnifyingGlass,
                                color: AppColors.greyDark,
                                size: 24.sp,
                              ),
                            ),
                            Gap(20.w),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(30),
                                splashColor: Colors.white.withOpacity(0.1),
                                highlightColor: Colors.white.withOpacity(0.1),
                                onTap: !isMoreOptionsSelected 
                                  ? () {
                                      print("Tab 2 pressed"); // Debug print
                                      onTabChange(2); // Wallet tab index
                                    }
                                  : null,
                                child: Container(
                                  padding: EdgeInsets.all(12.w),
                                  child: Icon(
                                    pageIndex == 2
                                        ? PhosphorIconsFill.storefront
                                        : PhosphorIconsBold.storefront,
                                    color: AppColors.greyDark,
                                    size: 24.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // More options buttons (fade in when more options selected)
                      AnimatedOpacity(
                        opacity: isMoreOptionsSelected ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        child: AbsorbPointer(
                          absorbing: !isMoreOptionsSelected,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                onPressed: onSortPressed,
                                icon: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      PhosphorIconsRegular.arrowBendDoubleUpLeft,
                                      color: AppColors.greyLight,
                                      size: 22.sp,
                                    ),
                                    Text(
                                      'Sort',
                                      style: TextStyle(
                                        color: AppColors.greyLight,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: onWatchlistPressed,
                                icon: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      PhosphorIconsRegular.star,
                                      color: AppColors.greyLight,
                                      size: 22.sp,
                                    ),
                                    Text(
                                      'Watchlist',
                                      style: TextStyle(
                                        color: AppColors.greyLight,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: onHidePressed,
                                icon: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      PhosphorIconsRegular.eye,
                                      color: AppColors.greyLight,
                                      size: 22.sp,
                                    ),
                                    Text(
                                      'Hide',
                                      style: TextStyle(
                                        color: AppColors.greyLight,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Dashboard floating action button - only add it when more options are not selected
              if (!isMoreOptionsSelected)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 95.h,
                    alignment: Alignment.topCenter,
                    child: DashboardFloatingActionButton(
                      show: pageIndex == 0,
                    ),
                  ),
                ),
            ],
          ),
        ), 
      ),
    );
}