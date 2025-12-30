import 'package:flt_omi/core/theme/app_pallet.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppPallet.white,
    colorScheme: const ColorScheme.light(
      primary: AppPallet.primarySurface,
      secondary: AppPallet.secondarySurface,
      surface: AppPallet.primarySurface,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPallet.primarySurface,
        foregroundColor: AppPallet.black,
        side: const BorderSide(color: AppPallet.black),
        textStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        minimumSize: const Size.fromHeight(48.0),
      ),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      contentPadding: const EdgeInsets.all(12.0),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 2.0, color: Colors.grey),
        borderRadius: BorderRadius.circular(30),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2.0, color: Colors.grey),
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}
