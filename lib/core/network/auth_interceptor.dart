import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../di/injection_container.dart';
import '../../data/datasources/remote/user_api.dart';

class AuthInterceptor extends Interceptor {
  final Ref ref;
  final UserApi userApi;

  Future<void>? _refreshFuture;

  AuthInterceptor({
    required this.ref,
    required this.userApi,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final sessionState = ref.read(tokenStoreProvider);
    final accessToken = sessionState.accessToken;
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final sessionState = ref.read(tokenStoreProvider);
      final refreshToken = sessionState.refreshToken;

      if (refreshToken != null) {
        try {
          // Single-flight refresh: if refresh is ongoing, await the same future
          if (_refreshFuture != null) {
            await _refreshFuture;
          } else {
            _refreshFuture = _doRefresh();
            await _refreshFuture;
            _refreshFuture = null;
          }

          // Retry original request with updated token
          final newSessionState = ref.read(tokenStoreProvider);
          final newAccessToken = newSessionState.accessToken;
          if (newAccessToken != null) {
            final requestOptions = err.requestOptions;
            requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

            final dio = Dio();
            final response = await dio.fetch(requestOptions);
            handler.resolve(response);
            return;
          }
        } catch (e) {
          // Refresh failed, clear tokens and continue with original error
          await ref.read(tokenStoreProvider.notifier).clear();
        }
      }
    }

    handler.next(err);
  }

  Future<void> _doRefresh() async {
    final sessionState = ref.read(tokenStoreProvider);
    final refreshToken = sessionState.refreshToken;
    if (refreshToken == null) {
      throw Exception('No refresh token available');
    }

    try {
      final response = await userApi.refreshToken(refreshToken);
      await ref.read(tokenStoreProvider.notifier).setTokens(
            accessToken: response.accessToken,
            refreshToken: response.refreshToken,
          );
    } catch (e) {
      await ref.read(tokenStoreProvider.notifier).clear();
      rethrow;
    }
  }
}
