import 'package:flt_omi/core/constants/app_texts.dart';
import 'package:flt_omi/core/validators/auth_validator.dart';
import 'package:flt_omi/features/auth/presentation/providers/auth_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final cnfpasswordController = TextEditingController();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(
                Icons.alternate_email_outlined,
              ),
            ),
            validator: AuthValidator.email,
          ),
          const SizedBox(height: 14.0),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(
                Icons.lock_outline_rounded,
              ),
            ),
            validator: AuthValidator.password,
          ),
          const SizedBox(height: 14.0),
          TextFormField(
            controller: cnfpasswordController,
            decoration: const InputDecoration(
              hintText: 'Confirm Password',
              prefixIcon: Icon(
                Icons.lock_outline_rounded,
              ),
            ),
            validator: (value) {
              return AuthValidator.confirmPassword(
                passwordController.text,
                value,
              );
            },
          ),
          const SizedBox(height: 32.0),
          Consumer(
            builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ref.read(authStateProvider.notifier).signUp(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                  }
                },
                child: const Text(AppTexts.signUp),
              );
            },
          )
        ],
      ),
    );
  }
}
