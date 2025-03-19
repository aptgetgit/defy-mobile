import 'package:flutter/material.dart';

/// Extensions for media query related properties
extension MediaQueryExtensions on BuildContext {
  /// Direct access to MediaQueryData
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Screen dimensions
  Size get screenSize => mediaQuery.size;
  double get screenHeight => screenSize.height;
  double get screenWidth => screenSize.width;

  /// Safe area paddings
  EdgeInsets get padding => mediaQuery.padding;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
  double get bottomInset => viewInsets.bottom;

  /// Screen orientation
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;
}

/// Extensions for theme related properties
extension ThemeExtensions on BuildContext {
  /// Theme access
  ThemeData get theme => Theme.of(this);

  /// Brightness
  Brightness get brightness => theme.brightness;
  bool get isDarkMode => brightness == Brightness.dark;

  /// Color scheme
  ColorScheme get colorScheme => theme.colorScheme;
}

/// Extensions for responsive breakpoints
extension ResponsiveExtensions on BuildContext {
  /// Breakpoint values
  static const double _kPhoneBreakpoint = 600;
  static const double _kTabletBreakpoint = 900;

  /// Device type checks
  bool get isPhone => screenWidth < _kPhoneBreakpoint;
  bool get isTablet =>
      screenWidth >= _kPhoneBreakpoint && screenWidth < _kTabletBreakpoint;
  bool get isDesktop => screenWidth >= _kTabletBreakpoint;
}

/// Extensions for text styles
extension TextStyleExtensions on BuildContext {
  /// Access to text theme
  TextTheme get textTheme => theme.textTheme;

  /// Display styles
  TextStyle? get displayLarge => textTheme.displayLarge;
  TextStyle? get displayMedium => textTheme.displayMedium;
  TextStyle? get displaySmall => textTheme.displaySmall;

  /// Headline styles
  TextStyle? get headlineLarge => textTheme.headlineLarge;
  TextStyle? get headlineMedium => textTheme.headlineMedium;
  TextStyle? get headlineSmall => textTheme.headlineSmall;

  /// Title styles
  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get titleMedium => textTheme.titleMedium;
  TextStyle? get titleSmall => textTheme.titleSmall;

  /// Body styles
  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;

  /// Label styles
  TextStyle? get labelLarge => textTheme.labelLarge;
  TextStyle? get labelMedium => textTheme.labelMedium;
  TextStyle? get labelSmall => textTheme.labelSmall;
}
