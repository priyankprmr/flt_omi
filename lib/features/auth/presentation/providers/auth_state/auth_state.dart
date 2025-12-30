import 'package:flt_omi/features/auth/domain/entities/user/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  // Initial state
  const factory AuthState.initial() = _Initial;
  // Loaidng state
  const factory AuthState.loading() = _Loading;
  // Authenticated state
  const factory AuthState.authenticated({required UserEntity user}) =
      _Authenticated;
  // Unauthenticated state
  const factory AuthState.unauthenticated() = _Unauthenticated;
  // Error state
  const factory AuthState.error({required String message}) = _Error;
}
