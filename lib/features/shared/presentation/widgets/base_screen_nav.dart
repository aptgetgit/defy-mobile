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
    this.onTabChange,
    super.key,
  });

  final Widget child;
  final int currentIndex;
  final bool isMoreOptionsSelected;
  final VoidCallback? onHidePressed;
  final VoidCallback? onSortPressed;
  final VoidCallback? onWatchlistPressed;
  final Function(bool)? onMoreOptionsChanged;
  final void Function(int)? onTabChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Stack(
    children: [
      child,
      Positioned(
        left: 24.w,
        right: 24.w,
        bottom: MediaQuery.of(context).padding.bottom,
        // Add this critical line - forces the nav bar to be drawn on top
        child: IgnorePointer(
          ignoring: false, // Set to false to ensure events reach the nav bar
          child: Material(
            type: MaterialType.transparency,
            child: CustomNavBar(
              pageIndex: currentIndex,
              onTabChange: (int index) {
                print("BASE: Tab changed to $index");
                if (index == 1 || index == 2) {
                  if (onTabChange != null) {
                    onTabChange!(index);
                  }
                } else if (index == 3 && onMoreOptionsChanged != null) {
                  onMoreOptionsChanged!(!isMoreOptionsSelected);
                }
              },
              isMoreOptionsSelected: isMoreOptionsSelected,
              onHidePressed: onHidePressed ?? () {},
              onSortPressed: onSortPressed ?? () {},
              onWatchlistPressed: onWatchlistPressed ?? () {},
            ),
          ),
        ),
      ),
    ],
  );
}