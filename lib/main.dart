import 'package:firebase_core/firebase_core.dart';
import 'package:flt_omi/core/theme/app_theme.dart';
import 'package:flt_omi/features/auth/presentation/providers/auth_is_loading_provider.dart';
import 'package:flt_omi/features/auth/presentation/providers/is_logged_in_provider.dart';
import 'package:flt_omi/features/auth/presentation/screen/auth_screen.dart';
import 'package:flt_omi/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  late OverlayEntry? _overlayEntry;

  void _showOverlay(BuildContext context) {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (_) => const Material(
        color: Colors.black54,
        child: Center(child: CircularProgressIndicator()),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OMI',
      theme: AppTheme.lightTheme,
      // darkTheme: ThemeData.dark(),
      home: Consumer(
        builder: (context, ref, child) {
          ref.listen(
            authIsLoadingProvider,
            (_, isLoading) {
              if (isLoading) {
                _showOverlay(context);
              } else {
                _hideOverlay();
              }
            },
          );

          final isLoggedIn = ref.watch(isLoggedInProvider);
          if (isLoggedIn) {
            return const Scaffold(
              body: Center(
                child: Text('HOME'),
              ),
            );
          } else {
            return const AuthScreen();
          }
        },
      ),
    );
  }
}
