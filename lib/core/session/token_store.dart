import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Session state for authenticated user and tokens.
class SessionState {
  final String? accessToken;
  final String? refreshToken;
  final DateTime? accessExpiry;
  final DateTime? refreshExpiry;

  const SessionState({
    this.accessToken,
    this.refreshToken,
    this.accessExpiry,
    this.refreshExpiry,
  });

  SessionState copyWith({
    String? accessToken,
    String? refreshToken,
    DateTime? accessExpiry,
    DateTime? refreshExpiry,
  }) {
    return SessionState(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      accessExpiry: accessExpiry ?? this.accessExpiry,
      refreshExpiry: refreshExpiry ?? this.refreshExpiry,
    );
  }
}

/// TokenStore manages reading/writing tokens and notifying listeners.
class TokenStore extends StateNotifier<SessionState> {
  final FlutterSecureStorage _secureStorage;

  TokenStore(this._secureStorage) : super(const SessionState());

  static const String _accessTokenKey = 'tn.access';
  static const String _refreshTokenKey = 'tn.refresh';
  static const String _accessExpiryKey = 'tn.access_exp';
  static const String _refreshExpiryKey = 'tn.refresh_exp';

  /// Hydrate session state from secure storage on app start.
  Future<void> hydrate() async {
    final accessToken = await _secureStorage.read(key: _accessTokenKey);
    final refreshToken = await _secureStorage.read(key: _refreshTokenKey);
    final accessExpiryStr = await _secureStorage.read(key: _accessExpiryKey);
    final refreshExpiryStr = await _secureStorage.read(key: _refreshExpiryKey);

    DateTime? accessExpiry;
    DateTime? refreshExpiry;

    if (accessExpiryStr != null) {
      accessExpiry = DateTime.tryParse(accessExpiryStr);
    }

    if (refreshExpiryStr != null) {
      refreshExpiry = DateTime.tryParse(refreshExpiryStr);
    }

    state = SessionState(
      accessToken: accessToken,
      refreshToken: refreshToken,
      accessExpiry: accessExpiry,
      refreshExpiry: refreshExpiry,
    );
  }

  /// Set session with user tokens after login succeeds.
  Future<void> setSession({
    required String accessToken,
    required String refreshToken,
    DateTime? accessExpiry,
    DateTime? refreshExpiry,
  }) async {
    await _secureStorage.write(key: _accessTokenKey, value: accessToken);
    await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);

    if (accessExpiry != null) {
      await _secureStorage.write(
        key: _accessExpiryKey,
        value: accessExpiry.toIso8601String(),
      );
    }

    if (refreshExpiry != null) {
      await _secureStorage.write(
        key: _refreshExpiryKey,
        value: refreshExpiry.toIso8601String(),
      );
    }

    state = SessionState(
      accessToken: accessToken,
      refreshToken: refreshToken,
      accessExpiry: accessExpiry,
      refreshExpiry: refreshExpiry,
    );
  }

  /// Set tokens after refresh_token API call.
  Future<void> setTokens({
    required String accessToken,
    required String refreshToken,
    DateTime? accessExpiry,
    DateTime? refreshExpiry,
  }) async {
    await setSession(
      accessToken: accessToken,
      refreshToken: refreshToken,
      accessExpiry: accessExpiry,
      refreshExpiry: refreshExpiry,
    );
  }

  /// Clear session on logout or failed refresh.
  Future<void> clear() async {
    await _secureStorage.delete(key: _accessTokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
    await _secureStorage.delete(key: _accessExpiryKey);
    await _secureStorage.delete(key: _refreshExpiryKey);

    state = const SessionState();
  }
}

/// TODO(auth): Later, provide a StateNotifierProvider for TokenStore in DI.
