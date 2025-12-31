import 'package:flt_omi/features/auth/data/firebase_auth_repo.dart';
import 'package:flt_omi/features/auth/domain/repo/auth_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepoProvider = Provider<AuthRepo>(
  (ref) => FirebaseAuthRepo(),
);
