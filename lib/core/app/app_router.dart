import 'package:flt_omi/features/auth/presentation/screen/auth_screen.dart';
import 'package:flt_omi/features/splash/presentation/screen/splash_screen.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:go_router/go_router.dart';

@immutable
class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
      ),
    ],
  );
}
