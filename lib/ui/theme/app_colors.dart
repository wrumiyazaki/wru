import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    required this.primary,
    required this.primaryVariant,
    required this.onPrimary,
    required this.secondary,
    required this.secondaryVariant,
    required this.onSecondary,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.error,
    required this.onError,
    required this.unselectedIcon,
    required this.selectedIcon,
    required this.barbackground,
    required this.homeProfileText,
    required this.homeProfileBackground,
    required this.qrCanPress,
    required this.qrCanNotPress,
    required this.exchangeBackground,
    required this.qrCode,
  });

  factory AppColors.light() {
    return const AppColors(
        primary: Color(0xFF6200EE),
        primaryVariant: Color(0xFF3700B3),
        onPrimary: Color(0xFFFFFFFF),
        secondary: Color(0xFF03DAC6),
        secondaryVariant: Color(0xFF018786),
        onSecondary: Color(0xFF000000),
        background: Color(0xFFFFFFFF),
        onBackground: Color(0xFF000000),
        surface: Color(0xFFFFFFFF),
        onSurface: Color(0xFF000000),
        error: Color(0xFFB00020),
        onError: Color(0xFFFFFFFF),
        unselectedIcon: Color.fromRGBO(158, 158, 158, 1),
        selectedIcon: Color(0xFFb58676),
        barbackground: Colors.white,
        homeProfileText: Colors.white,
        homeProfileBackground: Color(0xFF4e4f50),
        qrCanPress: Colors.white,
        qrCanNotPress: Colors.grey,
        exchangeBackground: Color(0xFF4e4f50),
        qrCode: Colors.white);
  }

  factory AppColors.dark() {
    return const AppColors(
      primary: Color(0xFF6200EE),
      primaryVariant: Color(0xFF3700B3),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFF03DAC6),
      secondaryVariant: Color(0xFF018786),
      onSecondary: Color(0xFF000000),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xFF000000),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF000000),
      error: Color(0xFFB00020),
      onError: Color(0xFFFFFFFF),
      unselectedIcon: Color.fromRGBO(158, 158, 158, 1),
      selectedIcon: Color(0xFFb58676),
      barbackground: Colors.white,
      homeProfileText: Colors.white,
      homeProfileBackground: Color(0xFF4e4f50),
      qrCanPress: Colors.white,
      qrCanNotPress: Colors.grey,
      exchangeBackground: Color(0xFF4e4f50),
      qrCode: Colors.white,
    );
  }

  /// Material Colors https://material.io/design/color/the-color-system.html#color-theme-creation
  final Color primary;
  final Color primaryVariant;
  final Color onPrimary;
  final Color secondary;
  final Color secondaryVariant;
  final Color onSecondary;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color error;
  final Color onError;
  final Color selectedIcon;
  final Color unselectedIcon;
  final Color barbackground;
  final Color homeProfileText;
  final Color homeProfileBackground;
  final Color qrCanPress;
  final Color qrCanNotPress;
  final Color exchangeBackground;
  final Color qrCode;
}
