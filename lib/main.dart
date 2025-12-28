import 'package:flt_omi/core/theme/app_theme.dart';
import 'package:flt_omi/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OMI',
      theme: AppTheme.lightTheme,
      // darkTheme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}
