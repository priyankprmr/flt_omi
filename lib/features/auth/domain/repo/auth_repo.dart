import 'package:flt_omi/features/auth/domain/entities/user/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity?> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<UserEntity?> registerWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> logout();
  Future<UserEntity?> getCurrentUser();
  Future<String> sendPasswordResetEmail(String email);
  Future<void> deleteAccount();
}
