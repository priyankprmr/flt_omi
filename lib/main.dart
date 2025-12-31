import 'package:firebase_core/firebase_core.dart';
import 'package:flt_omi/core/theme/app_theme.dart';
import 'package:flt_omi/core/utils/loading/loading_overlay.dart';
import 'package:flt_omi/features/auth/presentation/providers/auth_is_loading_provider.dart';
import 'package:flt_omi/features/auth/presentation/providers/auth_state_provider.dart';
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
    const ProviderScope(
      child: MyApp(),
    ),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OMI',
      theme: AppTheme.lightTheme,
      // darkTheme: ThemeData.dark(),
      home: Consumer(
        builder: (context, ref, child) {
          ref.listen(authIsLoadingProvider, (_, isLoading) {
            if (isLoading) {
              LoadingOverlay.instance().show(context: context);
            } else {
              LoadingOverlay.instance().hide();
            }
          });

          final isLoggedIn = ref.watch(isLoggedInProvider);
          if (isLoggedIn) {
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HOME'),
                  ElevatedButton(
                    onPressed: () =>
                        ref.read(authStateProvider.notifier).logout(),
                    child: const Text('Logout'),
                  )
                ],
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
