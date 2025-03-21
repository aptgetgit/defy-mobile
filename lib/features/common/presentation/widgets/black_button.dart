import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/colors.dart';

class BlackButton extends StatelessWidget {
  const BlackButton({super.key, this.title = 'Try Now'});
  final String title;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(45),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}

class BlackButtonXL extends StatelessWidget {
  const BlackButtonXL({
    required this.onClick,
    super.key,
    this.title = 'Try Now',
    this.horizontalPadding = true,
    this.color = AppColors.black,
    this.textColor = AppColors.white,
    this.margin = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  });
  final String title;
  final VoidCallback onClick;
  final bool horizontalPadding;
  final Color color;
  final Color textColor;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) => Align(
        child: GestureDetector(
          onTap: onClick,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(45),
            ),
            margin: margin,
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ? 24 : 0,
              vertical: 16,
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('title', title))
      ..add(ObjectFlagProperty<VoidCallback>.has('onClick', onClick))
      ..add(DiagnosticsProperty<bool>('horizontalPadding', horizontalPadding))
      ..add(ColorProperty('color', color))
      ..add(ColorProperty('textColor', textColor));
  }
}
