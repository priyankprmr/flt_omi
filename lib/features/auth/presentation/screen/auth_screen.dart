import 'package:flt_omi/core/constants/app_texts.dart';
import 'package:flt_omi/core/utils/padding.dart';
import 'package:flt_omi/features/auth/domain/auth_form_type.dart';
import 'package:flt_omi/features/auth/presentation/providers/auth_form_provider.dart';
import 'package:flt_omi/features/auth/presentation/widgets/signin_form.dart';
import 'package:flt_omi/features/auth/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Form type from auth form type provider
    final formType = ref.watch(authFormProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: switch (formType) {
          AuthFormType.signin => const Text(AppTexts.signIn),
          AuthFormType.signup => const Text(AppTexts.signUp),
        },
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 20.0),
            // Sign In and Sign Up forms
            switch (formType) {
              AuthFormType.signin => const SigninForm(),
              AuthFormType.signup => const SignupForm(),
            },
            const SizedBox(height: 20.0),
            // Buttons
            switch (formType) {
              AuthFormType.signin => ElevatedButton(
                  onPressed: () {}, child: const Text(AppTexts.signIn)),
              AuthFormType.signup => ElevatedButton(
                  onPressed: () {}, child: const Text(AppTexts.signUp)),
            },
            const SizedBox(height: 20.0),
            // Rich text to toggle forms
            Text.rich(
              switch (formType) {
                AuthFormType.signin => _formToggleText(
                    context: context,
                    prefixText: AppTexts.dontHaveAccount,
                    suffixText: AppTexts.signUp,
                    onTap: ref.read(authFormProvider.notifier).toggle,
                  ),
                AuthFormType.signup => _formToggleText(
                    context: context,
                    prefixText: AppTexts.alreadyHaveAccount,
                    suffixText: AppTexts.signIn,
                    onTap: ref.read(authFormProvider.notifier).toggle,
                  ),
              },
            ),
          ],
        ).padding(const EdgeInsets.symmetric(horizontal: 16.0)),
      ),
    );
  }

  TextSpan _formToggleText({
    required BuildContext context,
    required String prefixText,
    required String suffixText,
    required VoidCallback onTap,
  }) {
    return TextSpan(
      text: prefixText,
      style: Theme.of(context).textTheme.bodyLarge,
      children: [
        WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Text(
                suffixText,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      decoration: TextDecoration.underline,
                    ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
