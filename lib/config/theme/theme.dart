import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'colors.dart';

class AppTheme {
  static String get _primaryFont =>
      Platform.isIOS ? 'SFCompactRounded' : 'Nunito';
  static ThemeData get lightTheme => _buildTheme(isDark: false);
  static ThemeData get darkTheme => _buildTheme(isDark: true);

  static ThemeData _buildTheme({required bool isDark}) {
    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      primaryColor: isDark ? Colors.black : Colors.white,
      scaffoldBackgroundColor:
          isDark ? const Color(0xFF010101) : const Color(0xFFFFFFFF),
      fontFamily: _primaryFont,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        color: AppColors.transparent,
        iconTheme:
            IconThemeData(color: isDark ? AppColors.white : AppColors.black),
        titleTextStyle: TextStyle(
          color: isDark ? AppColors.white : AppColors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: isDark ? AppColors.blue : AppColors.black,
        onPrimary: AppColors.white,
        secondary: isDark ? AppColors.blue : AppColors.black,
        onSecondary: AppColors.white,
        error: AppColors.red,
        onError: AppColors.white,
        surface: isDark ? const Color(0xFF121212) : AppColors.white,
        onSurface: isDark ? AppColors.white : AppColors.black,
        surfaceContainerHighest: AppColors.transparent,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.transparent,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        selectedItemColor: isDark ? AppColors.white : AppColors.black,
        unselectedItemColor: AppColors.grey,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 0,
        shape: const CircleBorder(),
        backgroundColor: isDark ? AppColors.blue : AppColors.black,
        foregroundColor: AppColors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          backgroundColor: isDark ? AppColors.blue : AppColors.black,
          foregroundColor: AppColors.white,
          disabledBackgroundColor:
              isDark ? const Color(0xFF252525) : const Color(0xFFCFD2D8),
          disabledForegroundColor:
              isDark ? const Color(0xFF656565) : const Color(0xFFF4F4F6),
          textStyle: TextStyle(
            fontFamily: _primaryFont,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textTheme: _buildTextTheme(isDark: isDark),
    );
  }

  static TextTheme _buildTextTheme({required bool isDark}) {
    return TextTheme(
      displayLarge: _baseTextStyle(isDark, 32, FontWeight.bold),
      displayMedium: _baseTextStyle(isDark, 28, FontWeight.bold),
      displaySmall: _baseTextStyle(isDark, 24, FontWeight.bold),
      headlineLarge: _baseTextStyle(isDark, 22, FontWeight.w600),
      headlineMedium: _baseTextStyle(isDark, 20, FontWeight.w600),
      headlineSmall: _baseTextStyle(isDark, 18, FontWeight.w600),
      titleLarge: _baseTextStyle(isDark, 16, FontWeight.w600),
      titleMedium: _baseTextStyle(isDark, 14, FontWeight.w600),
      titleSmall: _baseTextStyle(isDark, 12, FontWeight.w600),
      bodyLarge: _baseTextStyle(isDark, 16, FontWeight.normal),
      bodyMedium: _baseTextStyle(isDark, 14, FontWeight.normal),
      bodySmall: _baseTextStyle(isDark, 12, FontWeight.normal),
      labelLarge: _baseTextStyle(isDark, 14, FontWeight.w500),
      labelMedium: _baseTextStyle(isDark, 12, FontWeight.w500),
      labelSmall: _baseTextStyle(isDark, 10, FontWeight.w500),
    );
  }

  static TextStyle _baseTextStyle(
      bool isDark, double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontFamily: _primaryFont,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: isDark ? AppColors.white : AppColors.black,
    );
  }

  static TextStyle textStyle({
    required BuildContext context,
    required double fontSize,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextStyle(
      fontFamily: _primaryFont,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? (isDark ? AppColors.white : AppColors.black),
    );
  }
}
