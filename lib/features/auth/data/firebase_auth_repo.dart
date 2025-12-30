import 'package:flt_omi/features/auth/domain/entities/user/user_entity.dart';
import 'package:flt_omi/features/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserEntity?> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCred =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCred.user == null) throw Exception('Something went wrong..');

      return UserEntity(
        uid: userCred.user!.uid,
        email: email,
      );
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  @override
  Future<UserEntity?> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCred.user == null) throw Exception('Something went wrong..');

      return UserEntity(
        uid: userCred.user!.uid,
        email: email,
      );
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final user = firebaseAuth.currentUser;

    if (user == null) throw Exception('No User Logged in...');
    return UserEntity(
      uid: user.uid,
      email: user.email!,
    );
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<String> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return 'Password reset email sent! Check your inbox.';
    } catch (e) {
      return 'Password reset failed: $e';
    }
  }

  @override
  Future<void> deleteAccount() async {
    try {
      final user = firebaseAuth.currentUser;

      if (user == null) throw Exception('No User Logged in...');

      await user.delete();
      await logout();
    } catch (e) {
      throw Exception('Failed to delete account: $e');
    }
  }
}
