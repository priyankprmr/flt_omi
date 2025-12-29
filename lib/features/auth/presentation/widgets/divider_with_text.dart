import 'package:flt_omi/core/theme/app_pallet.dart';
import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1.0,
            color: AppPallet.accentSurface,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
        const Text('Or'),
        Expanded(
          child: Container(
            height: 1.0,
            color: AppPallet.accentSurface,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
      ],
    );
  }
}
