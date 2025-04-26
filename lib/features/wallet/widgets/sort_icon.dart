import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';

class CustomSortIcon extends StatelessWidget {
  const CustomSortIcon({
    super.key,
    this.size,
    this.upArrowColor,
    this.downArrowColor,
    this.gap = 1.0,
  });

  /// Size of each arrow icon
  final double? size;
  
  /// Color of the up arrow (defaults to black)
  final Color? upArrowColor;
  
  /// Color of the down arrow (defaults to grey)
  final Color? downArrowColor;
  
  /// Gap between the arrows
  final double gap;

  @override
  Widget build(BuildContext context) {
    final double iconSize = size ?? 20.sp;
    final double gapSize = gap * 1.w;
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Up arrow in black
        Icon(
          PhosphorIconsBold.caretUp,
          size: iconSize,
          color: upArrowColor ?? AppColors.black,
        ),
        SizedBox(height: gapSize),
        // Down arrow in grey
        Transform.translate(
          offset: const Offset(0, -3), // Adjust to make arrows appear closer
          child: Icon(
            PhosphorIconsBold.caretDown,
            size: iconSize,
            color: downArrowColor ?? AppColors.greyLight,
          ),
        ),
      ],
    );
  }
}

/// Variant that places arrows side by side horizontally
class CustomSortIconHorizontal extends StatelessWidget {
  const CustomSortIconHorizontal({
    super.key,
    this.size,
    this.upArrowColor,
    this.downArrowColor,
    this.gap = 1.0,
  });

  /// Size of each arrow icon
  final double? size;
  
  /// Color of the up arrow (defaults to black)
  final Color? upArrowColor;
  
  /// Color of the down arrow (defaults to grey)
  final Color? downArrowColor;
  
  /// Gap between the arrows
  final double gap;

  @override
  Widget build(BuildContext context) {
    final double iconSize = size ?? 20.sp;
    final double gapSize = gap * 2.w;
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Up arrow in black
        Icon(
          PhosphorIconsBold.arrowUp,
          size: iconSize,
          color: upArrowColor ?? AppColors.black,
        ),
        SizedBox(width: gapSize),
        // Down arrow in grey
        Icon(
          PhosphorIconsBold.arrowDown,
          size: iconSize,
          color: downArrowColor ?? AppColors.greyLight,
        ),
      ],
    );
  }
}

/// Combined arrows icon that looks like the typical sort icon
class SortArrowsIcon extends StatelessWidget {
  const SortArrowsIcon({
    super.key,
    this.size,
    this.upArrowColor,
    this.downArrowColor,
  });

  /// Size of the overall icon
  final double? size;
  
  /// Color of the up arrow (defaults to black)
  final Color? upArrowColor;
  
  /// Color of the down arrow (defaults to grey)
  final Color? downArrowColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          PhosphorIconsBold.arrowsDownUp,
          size: size ?? 20.sp,
          color: AppColors.greyLight,
        ),
        Positioned(
          top: 5.h,
          child: Icon(
            PhosphorIconsBold.arrowUp,
            size: (size ?? 20.sp) * 0.6,
            color: upArrowColor ?? AppColors.black,
          ),
        ),
        Positioned(
          bottom: 5.h,
          child: Icon(
            PhosphorIconsBold.arrowDown,
            size: (size ?? 20.sp) * 0.6,
            color: downArrowColor ?? AppColors.greyLight,
          ),
        ),
      ],
    );
  }
}