import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(decoration: const InputDecoration(hintText: 'Email')),
          const SizedBox(height: 14.0),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          const SizedBox(height: 14.0),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Confirm Password'),
          ),
        ],
      ),
    );
  }
}
