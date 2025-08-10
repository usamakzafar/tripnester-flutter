import 'dart:io';

import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../session/session_controller.dart';
import '../network/auth_interceptor.dart';
import '../../data/datasources/remote/user_api.dart';
import '../../data/datasources/remote/autocomplete_api.dart';
import '../../data/repositories_impl/user_repository_impl.dart';
import '../../data/repositories_impl/autocomplete_repository_impl.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/repositories/autocomplete_repository.dart';
import '../../domain/usecases/authenticate_user.dart';
import '../../domain/usecases/register_user.dart';
import '../../domain/usecases/get_autocomplete_suggestions.dart';

/// Base Dio instance without interceptors for UserApi to avoid circular dependency.
final baseDioProvider = Provider<Dio>((ref) {
  return createDioInstanceWithProxyman();
});

/// UserApi provider - uses base Dio without auth interceptor to avoid circular dependency.
final userApiProvider = Provider<UserApi>(
      (ref) => UserApi(ref.read(baseDioProvider)),
);

/// Auth interceptor provider for handling token attachment and refresh.
final authInterceptorProvider = Provider<AuthInterceptor>(
  (ref) => AuthInterceptor(ref: ref),
);

/// Global Dio instance with auth interceptor for general API usage.
final dioProvider = Provider<Dio>((ref) {
  final Dio dio = createDioInstanceWithProxyman();
  dio.interceptors.add(ref.read(authInterceptorProvider));
  return dio;
});

/// AutocompleteApi provider for autocomplete/search operations.
final autocompleteApiProvider = Provider<AutocompleteApi>(
  (ref) => AutocompleteApi(ref.read(dioProvider)),
);

/// AutocompleteRepository provider for autocomplete operations.
final autocompleteRepositoryProvider = Provider<AutocompleteRepository>(
  (ref) => AutocompleteRepositoryImpl(ref.read(autocompleteApiProvider)),
);

/// GetAutocompleteSuggestions use case provider.
final getAutocompleteSuggestionsProvider = Provider<GetAutocompleteSuggestions>(
  (ref) => GetAutocompleteSuggestions(ref.read(autocompleteRepositoryProvider)),
);

/// UserRepository provider for user-related operations.
final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(
    userApi: ref.read(userApiProvider),
    sessionController: ref.read(sessionControllerProvider.notifier),
  ),
);

/// AuthenticateUser use case provider.
final authenticateUserProvider = Provider(
  (ref) => AuthenticateUser(ref.read(userRepositoryProvider)),
);

/// RegisterUser use case provider.
final registerUserProvider = Provider<RegisterUser>(
  (ref) => RegisterUser(ref.read(userRepositoryProvider)),
);

/// TODO(di): Add providers for APIs (PropertiesApi, BookingApi),
/// repositories, and usecases as they are created.
/// Use only Riverpod providers; do not add service locators.

Dio createDioInstanceWithProxyman() {
  final String proxy = Platform.isAndroid ? '192.168.50.123:9090' : 'localhost:9090';

  // Create a new Dio instance.
  final dio = Dio(BaseOptions(baseUrl: 'https://tripnester.com'));

  if (kDebugMode) {
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.findProxy = (uri) {
          return 'PROXY $proxy';
        };
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
      validateCertificate: (cert, host, port) {
        return true;
      },
    );
  }
  return dio;
}