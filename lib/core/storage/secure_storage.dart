import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Storage keys
const String kAccessTokenKey = 'access_token';
const String kRefreshTokenKey = 'refresh_token';
const String kUserJsonKey = 'current_user_json';

/// Provider for FlutterSecureStorage instance
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );
});

/// Secure storage service for session persistence
class SecureStorageService {
  const SecureStorageService(this._storage);

  final FlutterSecureStorage _storage;

  // Token operations
  Future<String?> getAccessToken() => _storage.read(key: kAccessTokenKey);
  Future<String?> getRefreshToken() => _storage.read(key: kRefreshTokenKey);
  Future<String?> getUserJson() => _storage.read(key: kUserJsonKey);

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _storage.write(key: kAccessTokenKey, value: accessToken),
      _storage.write(key: kRefreshTokenKey, value: refreshToken),
    ]);
  }

  Future<void> saveUserJson(String userJson) async {
    await _storage.write(key: kUserJsonKey, value: userJson);
  }

  Future<void> saveSession({
    required String accessToken,
    required String refreshToken,
    required String userJson,
  }) async {
    await Future.wait([
      _storage.write(key: kAccessTokenKey, value: accessToken),
      _storage.write(key: kRefreshTokenKey, value: refreshToken),
      _storage.write(key: kUserJsonKey, value: userJson),
    ]);
  }

  Future<void> clearSession() async {
    await Future.wait([
      _storage.delete(key: kAccessTokenKey),
      _storage.delete(key: kRefreshTokenKey),
      _storage.delete(key: kUserJsonKey),
    ]);
  }

  Future<bool> hasStoredSession() async {
    final accessToken = await getAccessToken();
    final refreshToken = await getRefreshToken();
    final userJson = await getUserJson();
    return accessToken != null && refreshToken != null && userJson != null;
  }
}

/// Provider for secure storage service
final secureStorageServiceProvider = Provider<SecureStorageService>((ref) {
  final storage = ref.read(secureStorageProvider);
  return SecureStorageService(storage);
});
