import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../session/session_controller.dart';
import 'dart:developer' as developer;

class AuthInterceptor extends Interceptor {
  AuthInterceptor({required this.ref});

  final Ref ref;
  bool _isRefreshingToken = false;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Get current access token from session
    final sessionController = ref.read(sessionControllerProvider.notifier);
    final accessToken = sessionController.getAccessToken();

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
      developer.log('🔐 Added auth header to ${options.path}', name: 'AuthInterceptor');
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Only handle 401 Unauthorized errors
    if (err.response?.statusCode == 401 && !_isRefreshingToken) {
      developer.log('🔒 401 error detected, attempting token refresh', name: 'AuthInterceptor');

      _isRefreshingToken = true;

      try {
        final sessionController = ref.read(sessionControllerProvider.notifier);
        final refreshSuccess = await sessionController.refresh();

        if (refreshSuccess) {
          // Retry the original request with new token
          final newAccessToken = sessionController.getAccessToken();
          if (newAccessToken != null) {
            final requestOptions = err.requestOptions;
            requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

            developer.log('🔄 Retrying request with new token', name: 'AuthInterceptor');

            // Create a new Dio instance to avoid interceptor loops
            final dio = Dio();
            final response = await dio.fetch(requestOptions);
            handler.resolve(response);
            return;
          }
        }

        // Refresh failed, sign out user
        developer.log('❌ Token refresh failed, signing out user', name: 'AuthInterceptor');
        await sessionController.signOut();
      } catch (e) {
        developer.log('❌ Error during token refresh: $e', name: 'AuthInterceptor');
        await ref.read(sessionControllerProvider.notifier).signOut();
      } finally {
        _isRefreshingToken = false;
      }
    }

    handler.next(err);
  }
}

/// Provider for auth interceptor
final authInterceptorProvider = Provider<AuthInterceptor>((ref) {
  return AuthInterceptor(ref: ref);
});
