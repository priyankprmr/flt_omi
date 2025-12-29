import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/auth_form_type.dart';

part 'auth_form_provider.g.dart';

@riverpod
class AuthForm extends _$AuthForm {
  @override
  AuthFormType build() => AuthFormType.signin;

  void toggle() {
    state = state == AuthFormType.signin
        ? AuthFormType.signup
        : AuthFormType.signin;
  }
}
