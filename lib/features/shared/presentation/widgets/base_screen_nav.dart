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
  Widget build(BuildContext context, WidgetRef ref) {
    print('BaseScreenWithNav build: currentIndex=$currentIndex');
    return Stack(
      children: [
        child,
        Positioned(
          left: 24.w,
          right: 24.w,
          bottom: MediaQuery.of(context).padding.bottom + 16.h, // Add padding to avoid overlap with system UI
          child: Hero(
            tag: 'bottom-nav-bar-hero',
            child: CustomNavBar(
              pageIndex: currentIndex,
              onTabChange: (int index) {
                print('BaseScreenWithNav: onTabChange called with index=$index');
                if (index == 1 || index == 2) {
                  if (onTabChange != null) {
                    onTabChange!(index);
                  }
                } else if (index == 3 && onMoreOptionsChanged != null) {
                  print('Toggling more options: $isMoreOptionsSelected -> ${!isMoreOptionsSelected}');
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
      ],
    );
  }
}