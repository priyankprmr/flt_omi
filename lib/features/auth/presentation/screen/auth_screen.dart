import 'package:flt_omi/core/utils/padding.dart';
import 'package:flt_omi/features/auth/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up'), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            const SignupForm().padding(
              const EdgeInsetsGeometry.symmetric(vertical: 20.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(onPressed: () {}, child: const Text('Sign Up')),
          ],
        ).padding(const EdgeInsets.symmetric(horizontal: 16.0)),
      ),
    );
  }
}
