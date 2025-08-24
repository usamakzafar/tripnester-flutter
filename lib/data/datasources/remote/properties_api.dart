import 'package:dio/dio.dart';
import '../../../core/network/api_exceptions.dart';
import '../../models/property/property_request_dto.dart';
import '../../models/property/property_details_response_dto.dart';
import '../../models/property/property_rooms_response_dto.dart';

class PropertiesApi {
  final Dio _dio;

  const PropertiesApi(this._dio);

  /// Fetch property details
  Future<PropertyDetailsResponseDto> fetchPropertyDetails({
    required String propertyId,
    required PropertyRequestDto request,
  }) async {
    try {
      final response = await _dio.post(
        '/api/properties/$propertyId',
        data: request.toJson(),
      );

      return PropertyDetailsResponseDto.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      final message = _extractErrorMessage(e);
      final statusCode = e.response?.statusCode;
      throw ApiException(message, statusCode: statusCode);
    } catch (e) {
      throw ApiException('An unexpected error occurred: $e');
    }
  }

  /// Fetch property rooms
  Future<PropertyRoomsResponseDto> fetchPropertyRooms({
    required String propertyId,
    required PropertyRequestDto request,
  }) async {
    try {
      final response = await _dio.post(
        '/api/properties/$propertyId/rooms',
        data: request.toJson(),
      );

      return PropertyRoomsResponseDto.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      final message = _extractErrorMessage(e);
      final statusCode = e.response?.statusCode;
      throw ApiException(message, statusCode: statusCode);
    } catch (e) {
      throw ApiException('An unexpected error occurred: $e');
    }
  }

  String _extractErrorMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.sendTimeout:
        return 'Request timeout. Please try again.';
      case DioExceptionType.receiveTimeout:
        return 'Server response timeout. Please try again.';
      case DioExceptionType.badResponse:
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
