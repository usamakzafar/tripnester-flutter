import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/search_repository.dart';
import '../../domain/entities/search/search_response.dart';
import '../../core/network/api_exceptions.dart';
import '../../core/config/currency_provider.dart';
import '../../core/config/residency_provider.dart';
import '../models/search/search_request_dto.dart';
import '../models/search/search_response_dto.dart';

class SearchRepositoryImpl implements SearchRepository {
  final Dio dio;
  final Ref ref;

  const SearchRepositoryImpl({
    required this.dio,
    required this.ref,
  });

  @override
  Future<SearchResponse> searchProperties({
    required String regionId,
    required String checkInDate,
    required String checkOutDate,
    required int numberOfRooms,
    required int numberOfAdults,
    required int numberOfChildren,
    List<int>? starRatings,
    int offset = 0,
    String? currencyOverride,
    String? residencyOverride,
  }) async {
    try {
      // Get currency and residency from centralized providers (synchronous)
      final currencyCode = ref.read(currencyProvider.notifier).currentOrDefault.code;
      final residencyCode = ref.read(residencyProvider.notifier).currentOrDefault.code;
      final curr = currencyOverride ?? currencyCode;
      final residency = residencyOverride ?? residencyCode;

      // Create the request DTO (dates must be YYYY-MM-DD)
      final requestDto = SearchRequestDto(
        checkInDate: _dateOnly(checkInDate),
        checkOutDate: _dateOnly(checkOutDate),
        numberOfRooms: numberOfRooms,
        numberOfAdults: numberOfAdults,
        numberOfChildren: numberOfChildren,
        residency: residency,
        filters: starRatings != null
            ? SearchFiltersDto(starRating: starRatings)
            : null,
        currency: curr,
        offset: offset,
      );

      final endpoint = '/api/regions/$regionId/properties';

      // Log the request for debugging
      print('🔍 [SearchRepository] POST $endpoint');
      print('📤 [SearchRepository] Request: ${requestDto.toJson()}');

      // Make the API call
      final response = await dio.post(
        endpoint,
        data: requestDto.toJson(),
      );

      // Log the response for debugging
      print('📥 [SearchRepository] Response: ${response.statusCode}');
      print('📥 [SearchRepository] Data: ${response.data}');

      // Parse the response
      final responseDto = SearchResponseDto.fromJson(response.data);

      // Convert to domain entity and return
      return responseDto.toDomain();

    } on DioException catch (e) {
      // Handle Dio errors and convert to ApiException
      final message = _extractErrorMessage(e);
      final statusCode = e.response?.statusCode;

      print('❌ [SearchRepository] Error: $message (Status: $statusCode)');

      throw ApiException(message, statusCode: statusCode);
    } catch (e) {
      // Handle any other unexpected errors
      print('❌ [SearchRepository] Unexpected error: $e');
      throw ApiException('An unexpected error occurred: $e');
    }
  }

  String _dateOnly(String value) {
    try {
      final d = DateTime.parse(value);
      final mm = d.month.toString().padLeft(2, '0');
      final dd = d.day.toString().padLeft(2, '0');
      return '${d.year}-$mm-$dd';
    } catch (_) {
      // Fallback: trim to first 10 chars if it looks like an ISO string
      return value.length >= 10 ? value.substring(0, 10) : value;
    }
  }

  /// Extract meaningful error message from DioException
  String _extractErrorMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.sendTimeout:
        return 'Request timeout. Please try again.';
      case DioExceptionType.receiveTimeout:
        return 'Server response timeout. Please try again.';
      case DioExceptionType.badResponse:
        // Try to extract server error message
        final data = e.response?.data;
        if (data is Map<String, dynamic> && data.containsKey('message')) {
          return data['message'] as String;
        }
        return 'Server error (${e.response?.statusCode})';
      case DioExceptionType.cancel:
        return 'Request was cancelled';
      case DioExceptionType.connectionError:
        return 'Connection error. Please check your internet connection.';
      case DioExceptionType.badCertificate:
        return 'Certificate error. Please try again.';
      case DioExceptionType.unknown:
      default:
        return e.message ?? 'Unknown network error';
    }
  }
}
