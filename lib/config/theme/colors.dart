import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  // Base colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  // Grey shades
  static const Color grey = Colors.grey;
  static const Color greyLight = Color(0xFF979DAA);
  static const Color greyMedium = Color(0xFFCFD2D8);
  static const Color greyDark = Color(0xFF646D80);
  static const Color greyVeryLight = Color(0xFFF5F5F6);
  static const Color greyLightest = Color(0xFFEFEFF2);
  static final Color grey300 = Colors.grey.shade300;

  // Background colors
  static const Color backgroundDark = Color(0xFF010101);
  static const Color backgroundLight = Color(0xFFFAFAFB);
  static const Color backgroundBlue = Color(0xFFE9F1FD);

  // Blue shades
  static const Color blue = Color(0xFF2071EE);
  static final Color blueLight = blue.withAlpha((0.2 * 255).round());

  // Green shades
  static const Color green = Color(0xFFE9F3EC);
  static const Color greenLight = Color(0xFF4EB13D);
  static const Color greenDark = Color(0xFF248444);
  static const Color greenPastel = Color(0xFF2A8189);

  // Text colors
  static const Color textGreen = Color(0xFF58BB47);
  static const Color textAlmostBlack = Color(0xFF252525);

  // Accent colors
  static const Color red = Color(0xFFFF6767);
  static const Color orange = Color(0xFFFFAD29);
  static const Color purple = Color(0xFFB621F2);
  static const Color yellow = Color(0xFFF0B90B);
  static const Color pink = Color(0xFFFA7AA2);
  static const Color magenta = Color(0xFFDD2282);
  static const Color orangeWarning = Color(0xFFFFAD29);

  // Utility colors
  static const Color divider = Color(0xFFF4F4F6);
}
