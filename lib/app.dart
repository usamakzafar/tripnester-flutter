import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'core/routing/app_router.dart';
import 'core/session/session_init.dart';

class TripNesterApp extends ConsumerWidget {
  const TripNesterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionInit = ref.watch(sessionInitProvider);
    final router = createAppRouter();

    return MaterialApp.router(
      title: 'TripNester',
      theme: AppTheme.light(),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return sessionInit.when(
          loading: () => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
          error: (error, stack) => Scaffold(
            body: Center(child: Text('Failed to initialize session: $error')),
          ),
          data: (_) => child!, // show the router output once ready
        );
      },
    );
  }
}