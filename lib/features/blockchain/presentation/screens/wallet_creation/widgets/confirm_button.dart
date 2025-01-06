import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ConfirmButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;
  final String label;
  const ConfirmButton({
    super.key,
    this.isActive = true,
    required this.onTap,
    this.label = 'Confirm',
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = false;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
        foregroundColor: colorFromHex('#F4F4F6'),
        backgroundColor: switch (isDarkMode) {
          false => isActive ? AppColors.black : colorFromHex('#CFD2D8'),
          _ => isActive ? colorFromHex('#2071EE') : colorFromHex('#656565'),
        },
        side: const BorderSide(color: AppColors.transparent),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: onTap,
      child: Text(label),
    );
  }
}
