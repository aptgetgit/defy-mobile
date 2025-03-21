import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../wallet/presentation/custom_nav_bar.dart';

class BaseScreenWithNav extends ConsumerWidget {
  const BaseScreenWithNav({
    required this.child,
    required this.currentIndex,
    this.onHidePressed,
    this.onSortPressed,
    this.onWatchlistPressed,
    this.isMoreOptionsSelected = false,
    this.onMoreOptionsChanged,
    super.key,
  });

  final Widget child;
  final int currentIndex;
  final bool isMoreOptionsSelected;
  final VoidCallback? onHidePressed;
  final VoidCallback? onSortPressed;
  final VoidCallback? onWatchlistPressed;
  final Function(bool)? onMoreOptionsChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Stack(
    children: [
      child,
      Positioned(
        left: 24.w,
        right: 24.w,
        bottom: MediaQuery.of(context).padding.bottom - 12.h,
        child: CustomNavBar(
          pageIndex: currentIndex,
          onTabChange: (int index) => index == 3 && onMoreOptionsChanged != null 
              ? onMoreOptionsChanged!(!isMoreOptionsSelected)
              : null,
          isMoreOptionsSelected: isMoreOptionsSelected,
          onHidePressed: onHidePressed ?? () {},
          onSortPressed: onSortPressed ?? () {},
          onWatchlistPressed: onWatchlistPressed ?? () {},
        ),
      ),
    ],
  );
}