import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum ButtonSize {
  small,
  medium,
  large
}

extension ButtonSizeExtension on ButtonSize {
  double get height => switch (this) {
    ButtonSize.small => 32,
    ButtonSize.medium => 40,
    ButtonSize.large => 48,
  };

  double get textSize => switch (this) {
    ButtonSize.small => 12,
    ButtonSize.medium => 14,
    ButtonSize.large => 16,
  };

  EdgeInsetsGeometry get padding => switch (this) {
    ButtonSize.small => const EdgeInsets.symmetric(horizontal: 12),
    ButtonSize.medium => const EdgeInsets.symmetric(horizontal: 16),
    ButtonSize.large => const EdgeInsets.symmetric(horizontal: 20),
  };

  double get borderRadius => switch (this) {
    ButtonSize.small => 4,
    ButtonSize.medium => 6,
    ButtonSize.large => 8,
  };

  ButtonStyle defaultStyle(BuildContext context) {
    final theme = Theme.of(context);
    return ButtonStyle(
      padding: WidgetStatePropertyAll(padding),
      minimumSize: WidgetStatePropertyAll(Size(0, height)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      textStyle: WidgetStatePropertyAll(TextStyle(fontSize: textSize)),
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return theme.disabledColor;
        }
        return theme.colorScheme.primary;
      }),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return theme.disabledColor.withOpacity(0.6);
        }
        return theme.colorScheme.onPrimary;
      }),
    );
  }
}