import 'package:flt_omi/features/auth/presentation/providers/auth_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(authStateProvider.notifier).checkAuth();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
    );
  }
}
