import 'package:flutter/material.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

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
        ],
      ),
    );
  }
}
