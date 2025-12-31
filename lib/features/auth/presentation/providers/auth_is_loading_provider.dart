import 'package:flt_omi/features/auth/presentation/providers/auth_state/auth_state.dart';
import 'package:flt_omi/features/auth/presentation/providers/auth_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authIsLoadingProvider = Provider<bool>(
  (ref) {
    final authState = ref.watch(authStateProvider);
    return authState == const AuthState.loading();
  },
);
