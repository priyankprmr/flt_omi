import 'package:flt_omi/core/validators/auth_validator.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
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
          decoration: const InputDecoration(
            hintText: 'Confirm Password',
            prefixIcon: Icon(
              Icons.lock_outline_rounded,
            ),
          ),
          validator: (value) {
            return AuthValidator.confirmPassword('', value);
          },
        ),
      ],
    );
  }
}
