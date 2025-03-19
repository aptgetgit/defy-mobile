import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ColorButton extends ConsumerWidget {
  const ColorButton({
    required this.color,
    required this.index,
    required this.onTap,
    required this.updateSliderPosition,
    required this.isSelected,
    super.key,
  });

  final Color color;
  final int index;
  final void Function(int) onTap;
  final void Function(double) updateSliderPosition;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) => GestureDetector(
      onTap: () {
        updateSliderPosition(index.toDouble());
        onTap(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: isSelected ? 40 : 32,
        width: isSelected ? 40 : 32,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
          boxShadow: isSelected
              ? <BoxShadow>[
                  BoxShadow(
                    color: color.withOpacity(0.6),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ]
              : <BoxShadow>[],
        ),
      ),
    );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('color', color))
      ..add(IntProperty('index', index))
      ..add(ObjectFlagProperty<void Function(int p1)>.has('onTap', onTap))
      ..add(
          ObjectFlagProperty<void Function(double p1)>.has('updateSliderPosition', updateSliderPosition))
      ..add(FlagProperty('isSelected', value: isSelected, ifTrue: 'selected'));
  }
}