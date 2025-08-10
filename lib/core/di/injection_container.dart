import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

/// Global Dio instance.
/// TODO(http): Add interceptors for logging/auth when TokenStore is ready.
final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: 'https://tripnester.com'));
});

/// TODO(di): Add providers for APIs (UserApi, PropertiesApi, BookingApi),
/// repositories, and usecases as they are created.
/// Use only Riverpod providers; do not add service locators.
