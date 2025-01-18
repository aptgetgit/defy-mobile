import 'package:flutter/material.dart';

enum ButtonSize {
  small(
    height: 32,
    textSize: 12,
    horizontalPadding: 12,
    borderRadius: 4,
  ),
  medium(
    height: 40,
    textSize: 14,
    horizontalPadding: 16,
    borderRadius: 6,
  ),
  large(
    height: 48,
    textSize: 16,
    horizontalPadding: 20,
    borderRadius: 8,
  );

  const ButtonSize({
    required this.height,
    required this.textSize,
    required this.horizontalPadding,
    required this.borderRadius,
  });

  final double height;
  final double textSize;
  final double horizontalPadding;
  final double borderRadius;
}

extension ButtonSizeExtension on ButtonSize {
  EdgeInsetsGeometry get padding => EdgeInsets.symmetric(
        horizontal: horizontalPadding,
      );

  BorderRadius get radius => BorderRadius.circular(borderRadius);

  ButtonStyle defaultStyle(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ButtonStyle(
      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(padding),
      minimumSize: WidgetStatePropertyAll<Size>(Size(0, height)),
      maximumSize: const WidgetStatePropertyAll<Size>(Size.infinite),
      shape: WidgetStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: radius),
      ),
      textStyle: WidgetStatePropertyAll<TextStyle>(
        TextStyle(fontSize: textSize),
      ),
      backgroundColor:
          WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return theme.disabledColor;
        }
        return theme.colorScheme.primary;
      }),
      foregroundColor:
          WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return theme.disabledColor.withAlpha((0.6 * 255).round());
        }
        return theme.colorScheme.onPrimary;
      }),
      elevation: const WidgetStatePropertyAll<double>(0),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
