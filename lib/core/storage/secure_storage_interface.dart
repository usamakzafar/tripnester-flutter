import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Generic secure storage interface
abstract class SecureStorage {
  Future<String?> read(String key);
  Future<void> write(String key, String value);
  Future<void> delete(String key);
  Future<void> deleteAll();
}

/// Implementation of SecureStorage using FlutterSecureStorage
class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage _storage;

  const SecureStorageImpl(this._storage);

  @override
  Future<String?> read(String key) => _storage.read(key: key);

  @override
  Future<void> write(String key, String value) => _storage.write(key: key, value: value);

  @override
  Future<void> delete(String key) => _storage.delete(key: key);

  @override
  Future<void> deleteAll() => _storage.deleteAll();
}
