import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Navigation helper for auth screens to handle proper navigation flow
class AuthNavigationHelper {
  /// Navigate from SignIn to Register by pushing (allows back navigation)
  static void navigateToRegister(BuildContext context) {
    context.push('/register');
  }

  /// Navigate from Register to SignIn by replacing (prevents stack buildup)
  static void navigateToSignIn(BuildContext context) {
    context.go('/login');
  }

  /// Navigate to home after successful authentication
  static void navigateToHome(BuildContext context) {
    context.go('/');
  }

  /// Handle back navigation for Register screen
  /// Returns true if the back action was handled, false otherwise
  static bool handleRegisterBack(BuildContext context) {
    navigateToSignIn(context);
    return true; // Indicate that we handled the back action
  }
}

/// A wrapper widget that handles system back button for auth screens
class AuthBackHandler extends StatelessWidget {
  const AuthBackHandler({
    super.key,
    required this.child,
    this.onWillPop,
  });

  final Widget child;
  final Future<bool> Function()? onWillPop;

  @override
  Widget build(BuildContext context) {
    if (onWillPop != null) {
      return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (!didPop) {
            final shouldPop = await onWillPop!();
            if (!shouldPop) {
              // Custom back handling was performed
              return;
            }
            // Allow default back behavior
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          }
        },
        child: child,
      );
    }
    return child;
  }
}
