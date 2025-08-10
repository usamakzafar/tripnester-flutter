import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../storage/secure_storage.dart';
import '../di/injection_container.dart';
import '../../domain/entities/user.dart';
import '../../domain/mappers/user_mapper.dart';
import '../../data/models/auth/user_dto.dart';
import '../../data/models/auth/role_dto.dart';
import '../../data/datasources/remote/user_api.dart';
import 'session_state.dart';

/// Session controller that manages authentication state and persistence
class SessionController extends Notifier<SessionState> {
  late final SecureStorageService _storage;
  late final UserApi _userApi;
  bool _isRefreshing = false;

  @override
  SessionState build() {
    _storage = ref.read(secureStorageServiceProvider);
    _userApi = ref.read(userApiProvider);
    return SessionState.initial();
  }

  /// Restore session from secure storage on app launch
  Future<void> restore() async {
    try {
      developer.log('🔄 Restoring session from storage', name: 'SessionController');

      final hasSession = await _storage.hasStoredSession();
      if (!hasSession) {
        developer.log('❌ No stored session found', name: 'SessionController');
        state = SessionState.unauthenticated();
        return;
      }

      final accessToken = await _storage.getAccessToken();
      final refreshToken = await _storage.getRefreshToken();
      final userJson = await _storage.getUserJson();

      if (accessToken == null || refreshToken == null || userJson == null) {
        developer.log('⚠️ Incomplete session data', name: 'SessionController');
        await _storage.clearSession();
        state = SessionState.unauthenticated();
        return;
      }

      // Parse user from stored JSON for validation
      try {
        final userMap = jsonDecode(userJson) as Map<String, dynamic>;
        final userDto = UserDto.fromJson(userMap);
        // We validate the stored user format but will use fresh data from API
        userDto.toDomain(); // Validate format
      } catch (e) {
        developer.log('❌ Failed to parse stored user: $e', name: 'SessionController');
        await _storage.clearSession();
        state = SessionState.unauthenticated();
        return;
      }

      // Verify token is still valid by calling /me endpoint
      try {
        final currentUserDto = await _userApi.me(accessToken);
        final currentUser = currentUserDto.toDomain();

        // Update state with verified session
        state = SessionState.authenticated(
          user: currentUser,
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

        // Update stored user data if different
        final currentUserJson = jsonEncode(currentUserDto.toJson());
        if (currentUserJson != userJson) {
          await _storage.saveUserJson(currentUserJson);
        }

        developer.log('✅ Session restored successfully', name: 'SessionController');
      } catch (e) {
        developer.log('⚠️ Token verification failed, attempting refresh: $e', name: 'SessionController');

        // Try to refresh tokens
        final refreshSuccess = await _attemptRefresh(refreshToken);
        if (!refreshSuccess) {
          await signOut();
        }
      }
    } catch (e) {
      developer.log('❌ Session restore failed: $e', name: 'SessionController');
      await signOut();
    }
  }

  /// Save session after successful sign-in or registration
  Future<void> signInOrRegisterSuccess({
    required AppUser user,
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      developer.log('💾 Saving authentication session', name: 'SessionController');

      // Create UserDto for consistent storage format
      final userDto = UserDto(
        id: user.id,
        username: user.email,
        name: user.name,
        roles: user.roles.map((role) => RoleDto(id: '', role: role)).toList(),
        phoneNumber: user.phoneNumber,
        avatar: user.avatar,
        onboardingCompleted: user.onboardingCompleted,
        isOAuthAccount: user.isOAuthAccount,
      );

      final userJson = jsonEncode(userDto.toJson());

      // Save to secure storage
      await _storage.saveSession(
        accessToken: accessToken,
        refreshToken: refreshToken,
        userJson: userJson,
      );

      // Update state
      state = SessionState.authenticated(
        user: user,
        accessToken: accessToken,
        refreshToken: refreshToken,
      );

      developer.log('✅ Session saved successfully', name: 'SessionController');
    } catch (e) {
      developer.log('❌ Failed to save session: $e', name: 'SessionController');
      throw Exception('Failed to save authentication session');
    }
  }

  /// Sign out and clear all session data
  Future<void> signOut() async {
    try {
      developer.log('🚪 Signing out user', name: 'SessionController');

      await _storage.clearSession();
      state = SessionState.unauthenticated();

      developer.log('✅ Sign out completed', name: 'SessionController');
    } catch (e) {
      developer.log('❌ Sign out failed: $e', name: 'SessionController');
      // Even if storage clear fails, update state to signed out
      state = SessionState.unauthenticated();
    }
  }

  /// Get current access token for API calls
  String? getAccessToken() {
    return state.accessToken;
  }

  /// Refresh access token using refresh token
  Future<bool> refresh() async {
    if (_isRefreshing) {
      developer.log('⏳ Refresh already in progress', name: 'SessionController');
      return false;
    }

    final refreshToken = state.refreshToken;
    if (refreshToken == null) {
      developer.log('❌ No refresh token available', name: 'SessionController');
      return false;
    }

    return await _attemptRefresh(refreshToken);
  }

  /// Internal method to attempt token refresh
  Future<bool> _attemptRefresh(String refreshToken) async {
    if (_isRefreshing) return false;

    _isRefreshing = true;
    try {
      developer.log('🔄 Attempting to refresh tokens', name: 'SessionController');

      final response = await _userApi.refreshToken(refreshToken);

      // Update tokens in storage and state
      await _storage.saveTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );

      state = state.copyWith(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );

      developer.log('✅ Tokens refreshed successfully', name: 'SessionController');
      return true;
    } catch (e) {
      developer.log('❌ Token refresh failed: $e', name: 'SessionController');
      return false;
    } finally {
      _isRefreshing = false;
    }
  }
}

/// Provider for session controller
final sessionControllerProvider = NotifierProvider<SessionController, SessionState>(
  SessionController.new,
);

/// Session initialization provider - call this once at app startup
final sessionInitProvider = FutureProvider<void>((ref) async {
  final controller = ref.read(sessionControllerProvider.notifier);
  await controller.restore();
});
