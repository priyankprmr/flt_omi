import 'package:flt_omi/features/auth/data/providers/auth_repo_provider.dart'
    show authRepoProvider;
import 'package:flt_omi/features/auth/domain/entities/user/user_entity.dart';
import 'package:flt_omi/features/auth/domain/repo/auth_repo.dart';
import 'package:flt_omi/features/auth/presentation/providers/auth_state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = NotifierProvider<AuthStateProvider, AuthState>(
  () => AuthStateProvider(),
);

class AuthStateProvider extends Notifier<AuthState> {
  late AuthRepo _authRepo;
  late UserEntity? _currentUser;
  UserEntity? get currentUser => _currentUser;

  @override
  AuthState build() {
    _authRepo = ref.read(authRepoProvider);
    checkAuth();
    return const AuthState.initial();
  }

  void checkAuth() async {
    state = const AuthState.loading();
    Future.delayed(const Duration(seconds: 10));

    _currentUser = await _authRepo.getCurrentUser();
    if (_currentUser == null) {
      state = const AuthState.unauthenticated();
    } else {
      state = AuthState.authenticated(user: _currentUser!);
    }
  }
}
