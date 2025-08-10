import 'package:dio/dio.dart';

String getFriendlyErrorMessage(dynamic error) {
  // DioError handling
  if (error is DioException) {
    // Server responded with error
    if (error.type == DioExceptionType.badResponse && error.response != null) {
      final data = error.response?.data;

      if (data is Map<String, dynamic> && data['message'] != null) {
        return data['message'];
      }
      return "Login failed. Please check your email and password.";
    }

    // Network timeout or no internet
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError) {
      return "Unable to connect. Please check your internet connection.";
    }

    // All other Dio errors
    return "Something went wrong. Please try again.";
  }

  // Fallback for all other errors
  return "Something went wrong. Please try again.";
}