import 'package:flt_omi/core/theme/app_theme.dart';
import 'package:flt_omi/features/auth/presentation/screen/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
      home: const AuthScreen(),
    );
  }
}
