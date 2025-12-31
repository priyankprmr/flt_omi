import 'package:flt_omi/features/auth/presentation/providers/auth_state/auth_state.dart';
import 'package:flt_omi/features/auth/presentation/providers/auth_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isLoggedInProvider = Provider<bool>(
  (ref) {
    final state = ref.watch(authStateProvider);
    return state.maybeWhen<bool>(
      orElse: () => false,
      authenticated: (user) => true,
    );
  },
);
