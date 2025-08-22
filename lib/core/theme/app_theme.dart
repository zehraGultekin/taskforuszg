import 'package:flutter/material.dart';
import 'package:taskforuszehra/core/theme/Appcolors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
    ),

    scaffoldBackgroundColor: Appcolors.primary,

    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Appcolors.primary,
      onPrimary: Colors.white,
      secondary: Appcolors.secondary,
      onSecondary: Colors.white,
      error: Appcolors.error,
      onError: Colors.white,
      surface: Appcolors.surface,
      onSurface: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Appcolors.secondary,
      foregroundColor: Colors.white,
    ),
  );
}
