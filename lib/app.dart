import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/routing/app_router.dart';
import 'core/session/session_init.dart';
import 'core/theme/app_theme.dart';

class TripNesterApp extends StatelessWidget {
  const TripNesterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TripNester',
      theme: AppTheme.light(),
      debugShowCheckedModeBanner: false,
      home: Consumer(
        builder: (context, ref, child) {
          final sessionInit = ref.watch(sessionInitProvider);

          return sessionInit.when(
            data: (_) {
              // Session initialized, show main app
              final router = createAppRouter();
              return MaterialApp.router(
                title: 'TripNester',
                routerConfig: router,
                debugShowCheckedModeBanner: false,
              );
            },
            loading: () => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, stack) => Scaffold(
              body: Center(
                child: Text('Failed to initialize session: $error'),
              ),
            ),
          );
        },
      ),
    );
  }
}
