import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/theme/colors.dart';

class ColorButton extends ConsumerWidget {
  const ColorButton({
    required this.color,
    required this.index,
    required this.onTap,
    required this.updateSliderPosition,
    required this.isSelected,
    super.key,
  });

  final LinearGradient color;
  final int index;
  final void Function(int) onTap;
  final void Function(double) updateSliderPosition;
  final bool isSelected;
  final int totalColors = 5;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double baseSize = 28;
    const double selectedSize = 40;
    const double minSizeFactor = 0.7;
    const double maxSizeFactor = 1.0;
    const double scalingFactor = 0.2; // Increased for better impact

    const int centerIndex = 5; // Adjust based on your logic
    final int distance = (index - centerIndex).abs();

    final double sizeFactor = isSelected
        ? (selectedSize / baseSize)
        : (maxSizeFactor - (distance * scalingFactor))
            .clamp(minSizeFactor, maxSizeFactor);

    final double dynamicSize = baseSize * sizeFactor;

    return GestureDetector(
      onTap: () {
        updateSliderPosition(index.toDouble());
        onTap(index);
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: isSelected ? selectedSize : dynamicSize,
            width: isSelected ? selectedSize : dynamicSize,
            decoration: BoxDecoration(
              gradient: color,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          if (isSelected)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: isSelected ? 36 : 28,
              width: isSelected ? 36 : 28,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          if (isSelected)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: isSelected ? 30 : 22,
              width: isSelected ? 30 : 22,
              decoration: BoxDecoration(
                gradient: color,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('index', index))
      ..add(ObjectFlagProperty<void Function(int p1)>.has('onTap', onTap))
      ..add(ObjectFlagProperty<void Function(double p1)>.has(
          'updateSliderPosition', updateSliderPosition))
      ..add(FlagProperty('isSelected', value: isSelected, ifTrue: 'selected'))
      ..add(DiagnosticsProperty<LinearGradient>('color', color))
      ..add(IntProperty('totalColors', totalColors));
  }
}
