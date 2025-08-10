import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user.dart';

/// Session controller that manages the current authenticated user state.
class SessionController extends StateNotifier<AppUser?> {
  SessionController() : super(null);

  /// Set the authenticated user and tokens after successful login/register.
  Future<void> setAuthenticated({
    required AppUser user,
    required String accessToken,
    required String refreshToken,
  }) async {
    state = user;
  }

  /// Clear the current user session.
  void clearSession() {
    state = null;
  }
}

/// Provider for the session controller.
final sessionControllerProvider = StateNotifierProvider<SessionController, AppUser?>((ref) {
  return SessionController();
});
