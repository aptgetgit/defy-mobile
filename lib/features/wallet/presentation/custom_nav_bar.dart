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
    this.isNFTExplore = false,
    this.isNFTMoreOptionsSelected = false,
  });

  final int pageIndex;
  final Function(int) onTabChange;
  final bool isMoreOptionsSelected;
  final VoidCallback onHidePressed;
  final VoidCallback onSortPressed;
  final VoidCallback onWatchlistPressed;
  final bool isNFTExplore;
  final bool isNFTMoreOptionsSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAnyMoreOptionsSelected = isMoreOptionsSelected || (isNFTExplore && isNFTMoreOptionsSelected);

    return Container(
      color: Colors.transparent,
      height: isNFTExplore ? 120.h : 97.h,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: isAnyMoreOptionsSelected ? 0.7.sw : 0.6.sw,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: isAnyMoreOptionsSelected ? 100.h : 90.h,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: isAnyMoreOptionsSelected
                      ? BorderRadius.circular(24.r)
                      : BorderRadius.circular(64.r),
                ),
                margin: EdgeInsets.only(top: 18.h, bottom: 18.h),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      AnimatedOpacity(
                        opacity: !isAnyMoreOptionsSelected ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: IgnorePointer(
                          ignoring: isAnyMoreOptionsSelected,
                          child: isNFTExplore
                              ? Container(
                                  width: 1.0.sw,
                                  height: 90.h,
                                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      _nftNavItem(
                                        label: 'Sell',
                                        icon: PhosphorIcons.shoppingCart(),
                                        isSelected: pageIndex == 0,
                                        onTap: () => onTabChange(0),
                                      ),
                                      _nftNavItem(
                                        label: 'Cart',
                                        icon: PhosphorIcons.tag(),
                                        isSelected: pageIndex == 1,
                                        onTap: () => onTabChange(1),
                                      ),
                                      _nftNavItem(
                                        label: 'Orders',
                                        icon: PhosphorIcons.clipboardText(),
                                        isSelected: pageIndex == 2,
                                        onTap: () => onTabChange(2),
                                      ),
                                      _nftNavItem(
                                        label: 'Spins',
                                        icon: PhosphorIcons.wallet(),
                                        isSelected: pageIndex == 3,
                                        onTap: () => onTabChange(3),
                                      ),
                                    ],
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(30.r),
                                        splashColor: Colors.white.withOpacity(0.1),
                                        highlightColor: Colors.white.withOpacity(0.1),
                                        onTap: () => onTabChange(1),
                                        child: Container(
                                          padding: EdgeInsets.all(12.w),
                                          child: Icon(
                                            pageIndex == 1
                                                ? PhosphorIconsFill.magnifyingGlass
                                                : PhosphorIconsBold.magnifyingGlass,
                                            color: AppColors.greyDark,
                                            size: 24.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Gap(20.w),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(30.r),
                                        splashColor: Colors.white.withOpacity(0.1),
                                        highlightColor: Colors.white.withOpacity(0.1),
                                        onTap: () => onTabChange(2),
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
                      ),
                      AnimatedOpacity(
                        opacity: isAnyMoreOptionsSelected ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: IgnorePointer(
                          ignoring: !isAnyMoreOptionsSelected,
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
              if (!isAnyMoreOptionsSelected && !isNFTExplore)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 95.h,
                    alignment: Alignment.topCenter,
                    child: IgnorePointer(
                      ignoring: false,
                      child: DashboardFloatingActionButton(
                        show: pageIndex == 0,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nftNavItem({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.blue : Colors.white,
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : AppColors.greyDark,
              size: 24.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}