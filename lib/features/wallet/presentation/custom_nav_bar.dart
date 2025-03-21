import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../app/routes/router.dart';
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
     
      child: AnimatedSize(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 800),
        child: Center(
          child: FractionallySizedBox(
            widthFactor: !isMoreOptionsSelected ? 0.7 : 0.8,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 90.h,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: isMoreOptionsSelected 
                        ? BorderRadius.circular(24.r) 
                        : BorderRadius.circular(64.r),
                  ),
                  margin: EdgeInsets.only(top: 18.h, bottom: 18.h),
                  child: Center(
                    child: !isMoreOptionsSelected
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  const ExploreScreenRoute().go(context);
                                },
                                icon: Icon(
                                  pageIndex == 1
                                      ? PhosphorIconsFill.magnifyingGlass
                                      : PhosphorIconsBold.magnifyingGlass,
                                  color: AppColors.greyDark,
                                  size: 24.sp,
                                ),
                              ),
                              Gap(20.w),
                              IconButton(
                                onPressed: () {
                                  const WalletScreenRoute().go(context);
                                },
                                icon: Icon(
                                  pageIndex == 2
                                      ? PhosphorIconsFill.storefront
                                      : PhosphorIconsBold.storefront,
                                  color: AppColors.greyDark,
                                  size: 24.sp,
                                ),
                              ),
                            ],
                          )
                        : Row(
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
                                      'Filter',
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
                Visibility(
                  visible: !isMoreOptionsSelected,
                  child: AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Container(
                      height: 95.h,
                      alignment: Alignment.topCenter,
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
      ),
    );
}