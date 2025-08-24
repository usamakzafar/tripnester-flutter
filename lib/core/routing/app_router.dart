import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/auth/sign_in_screen.dart';
import '../../presentation/auth/register_screen.dart';
import '../../presentation/home/home_screen.dart';
import '../../presentation/search/search_screen.dart';
import '../session/session_controller.dart';
import '../../presentation/listings/property_listings_screen.dart';
import '../../presentation/listings/listing_search_args.dart';

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

/// Creates the app router with authentication guards
GoRouter createAppRouter(WidgetRef ref) {
  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final sessionState = ref.read(sessionControllerProvider);
      final path = state.uri.path;

      // Show splash during session restoration
      if (sessionState.isRestoring) {
        return path == '/splash' ? null : '/splash';
      }

      // Redirect authenticated users away from auth screens
      if (sessionState.isAuthenticated) {
        if (path == '/login' || path == '/register' || path == '/splash') {
          return '/';
        }
        return null; // Stay on current route
      }

      // Redirect unauthenticated users to login (except for register)
      if (!sessionState.isAuthenticated) {
        if (path == '/register' || path == '/login') {
          return null; // Allow access to auth screens
        }
        return '/login';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (_, __) => const SignInScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (_, __) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (_, __) => const HomeScreen(),
      ),
      GoRoute(
        path: '/search',
        builder: (_, __) => const SearchScreen(),
      ),
      GoRoute(
        path: '/listings',
        builder: (context, state) {
          final extra = state.extra;
          if (extra is ListingSearchArgs) {
            return PropertyListingsScreen(
              regionId: extra.regionId,
              propertyId: extra.propertyId,
              args: extra,
            );
          }
          // Fallback if args missing
          return const Scaffold(
            body: Center(child: Text('Missing search parameters')),
          );
        },
      ),
    ],
  );
}
