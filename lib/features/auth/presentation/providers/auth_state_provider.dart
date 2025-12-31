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

    _currentUser = await _authRepo.getCurrentUser();
    if (_currentUser == null) {
      state = const AuthState.unauthenticated();
    } else {
      state = AuthState.authenticated(user: _currentUser!);
    }
  }

  void login({required String email, required String password}) async {
    try {
      state = const AuthState.loading();

      _currentUser = await _authRepo.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (_currentUser != null) {
        state = AuthState.authenticated(user: _currentUser!);
      } else {
        state = const AuthState.unauthenticated();
      }
    } catch (e) {
      state = AuthState.error(message: e.toString());
    }
  }

  void signUp({required String email, required String password}) async {
    try {
      state = const AuthState.loading();

      _currentUser = await _authRepo.registerWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (_currentUser != null) {
        state = AuthState.authenticated(user: _currentUser!);
      } else {
        state = const AuthState.unauthenticated();
      }
    } catch (e) {
      state = AuthState.error(message: e.toString());
    }
  }

  void logout() async {
    state = const AuthState.loading();
    await _authRepo.logout();
    state = const AuthState.unauthenticated();
  }
}
