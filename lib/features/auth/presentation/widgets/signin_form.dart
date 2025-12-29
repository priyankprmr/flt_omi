import 'package:flutter/material.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(
                Icons.alternate_email_outlined,
              ),
            ),
          ),
          const SizedBox(height: 14.0),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(
                Icons.lock_outline_rounded,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
