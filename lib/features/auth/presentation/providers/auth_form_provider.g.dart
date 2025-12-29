// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthForm)
final authFormProvider = AuthFormProvider._();

final class AuthFormProvider extends $NotifierProvider<AuthForm, AuthFormType> {
  AuthFormProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authFormProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authFormHash();

  @$internal
  @override
  AuthForm create() => AuthForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthFormType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthFormType>(value),
    );
  }
}

String _$authFormHash() => r'1b6e052dcc88d0904816c97fbde5ff62e510f937';

abstract class _$AuthForm extends $Notifier<AuthFormType> {
  AuthFormType build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AuthFormType, AuthFormType>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AuthFormType, AuthFormType>,
        AuthFormType,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
