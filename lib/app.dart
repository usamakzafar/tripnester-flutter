import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'core/routing/app_router.dart';
import 'core/session/session_controller.dart';

class TripNesterApp extends ConsumerWidget {
  const TripNesterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initialize session restoration on app startup
    final sessionInit = ref.watch(sessionInitProvider);

    return sessionInit.when(
      loading: () => MaterialApp(
        title: 'TripNester',
        theme: AppTheme.light(),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
      error: (error, stack) => MaterialApp(
        title: 'TripNester',
        theme: AppTheme.light(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text('Failed to initialize app: $error'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => ref.invalidate(sessionInitProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
      data: (_) {
        // Session initialized, create router with ref for session-aware redirects
        final router = createAppRouter(ref);

        return MaterialApp.router(
          title: 'TripNester',
          theme: AppTheme.light(),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

/// Splash screen shown during session restoration
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logos/logo-white.png',
              height: 84,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.hotel,
                size: 84,
                color: theme.colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 24),
            CircularProgressIndicator(
              color: theme.colorScheme.onPrimary,
            ),
            const SizedBox(height: 16),
            Text(
              'Loading...',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
