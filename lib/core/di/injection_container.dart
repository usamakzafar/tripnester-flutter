import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../session/token_store.dart';
import '../network/auth_interceptor.dart';
import '../../data/datasources/remote/user_api.dart';
import '../../data/repositories_impl/user_repository_impl.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/authenticate_user.dart';

/// Secure storage provider for token persistence.
final secureStorageProvider = Provider<FlutterSecureStorage>(
  (_) => const FlutterSecureStorage(),
);

/// Token store provider for session management.
final tokenStoreProvider = StateNotifierProvider<TokenStore, SessionState>((
  ref,
) {
  return TokenStore(ref.read(secureStorageProvider));
});

/// Base Dio instance without interceptors for UserApi to avoid circular dependency.
final baseDioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: 'https://tripnester.com'));
});

/// UserApi provider - uses base Dio without auth interceptor to avoid circular dependency.
final userApiProvider = Provider<UserApi>(
  (ref) => UserApi(ref.read(baseDioProvider)),
);

/// Auth interceptor provider for handling token attachment and refresh.
final authInterceptorProvider = Provider<AuthInterceptor>(
  (ref) => AuthInterceptor(ref: ref, userApi: ref.read(userApiProvider)),
);

/// Global Dio instance with auth interceptor for general API usage.
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(baseUrl: 'https://tripnester.com'));
  dio.interceptors.add(ref.read(authInterceptorProvider));
  return dio;
});

/// UserRepository provider for user-related operations.
final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(
    userApi: ref.read(userApiProvider),
    tokenStore: ref.read(tokenStoreProvider.notifier),
  ),
);

/// AuthenticateUser use case provider.
final authenticateUserProvider = Provider(
  (ref) => AuthenticateUser(ref.read(userRepositoryProvider)),
);

/// TODO(di): Add providers for APIs (PropertiesApi, BookingApi),
/// repositories, and usecases as they are created.
/// Use only Riverpod providers; do not add service locators.
