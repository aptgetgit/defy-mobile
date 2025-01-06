import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  void unfocus() => FocusScope.of(this).unfocus();
}

extension MediaQueryExtensions on BuildContext {
  // Access to MediaQueryData
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  // Screen dimensions
  double get screenHeight => mediaQuery.size.height;
  double get screenWidth => mediaQuery.size.width;

  // Device padding
  EdgeInsets get padding => mediaQuery.padding;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
}

extension ThemeModeExtensions on BuildContext {
  // Theme brightness
  Brightness get brightness => Theme.of(this).brightness;

  // Dark mode check
  bool get isDarkMode => brightness == Brightness.dark;

  //theme data
  ThemeData get themeData => Theme.of(this);
}

extension OrientationExtensions on BuildContext {
  // Landscape mode check
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  // Portrait mode check
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;
}

extension ResponsiveExtensions on BuildContext {
  // Phone screen check (width < 600dp)
  bool get isPhone => mediaQuery.size.width < 600;

  // Tablet screen check (600dp <= width < 900dp)
  bool get isTablet => mediaQuery.size.width >= 600 && mediaQuery.size.width < 900;

  // Desktop screen check (width >= 900dp)
  bool get isDesktop => mediaQuery.size.width >= 900;
}

extension TextStyleExtensions on BuildContext {
  TextStyle get displayLarge => Theme.of(this).textTheme.displayLarge!;
  TextStyle get displayMedium => Theme.of(this).textTheme.displayMedium!;
  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall!;
  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;
  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;
  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;
  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;
  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!;
  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;
  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;
  TextStyle get labelLarge => Theme.of(this).textTheme.labelLarge!;
  TextStyle get labelMedium => Theme.of(this).textTheme.labelMedium!;
  TextStyle get labelSmall => Theme.of(this).textTheme.labelSmall!;
}
