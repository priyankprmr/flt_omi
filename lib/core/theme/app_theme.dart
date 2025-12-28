import 'package:flt_omi/core/theme/app_pallet.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppPallet.background,
    colorScheme: ColorScheme.light(
      primary: AppPallet.primarySurface,
      secondary: AppPallet.secondarySurface,
      surface: AppPallet.primarySurface,
    ),
  );
}
