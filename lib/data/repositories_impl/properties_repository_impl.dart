import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/properties_repository.dart';
import '../../domain/entities/property/property_details.dart';
import '../../domain/entities/property/property_rooms.dart';
import '../../core/config/currency_provider.dart';
import '../../core/config/residency_provider.dart';
import '../datasources/remote/properties_api.dart';
import '../models/property/property_request_dto.dart';
import '../mappers/property_mappers.dart';

class PropertiesRepositoryImpl implements PropertiesRepository {
  final PropertiesApi _api;
  final Ref _ref;

  const PropertiesRepositoryImpl({
    required PropertiesApi api,
    required Ref ref,
  }) : _api = api, _ref = ref;

  @override
  Future<PropertyDetails> getPropertyDetails({
    required String propertyId,
    required DateTime checkInDate,
    required DateTime checkOutDate,
    required int numberOfRooms,
    required int numberOfAdults,
    required int numberOfChildren,
  }) async {
    try {
      // Get currency and residency from centralized providers
      final currencyCode = _ref.read(currencyProvider.notifier).currencyCode;
      final residencyCode = _ref.read(residencyProvider.notifier).currentOrDefault.code;

      final request = PropertyRequestDto(
        checkInDate: _formatDate(checkInDate),
        checkOutDate: _formatDate(checkOutDate),
        numberOfRooms: numberOfRooms,
        numberOfAdults: numberOfAdults,
        numberOfChildren: numberOfChildren,
        residency: residencyCode,
        currency: currencyCode,
      );

      final responseDto = await _api.fetchPropertyDetails(
        propertyId: propertyId,
        request: request,
      );

      return PropertyDetailsMapper.fromDto(responseDto);
    } catch (e) {
      // Re-throw ApiExceptions from the API layer
      rethrow;
    }
  }

  @override
  Future<PropertyRooms> getPropertyRooms({
    required String propertyId,
    required DateTime checkInDate,
    required DateTime checkOutDate,
    required int numberOfRooms,
    required int numberOfAdults,
    required int numberOfChildren,
  }) async {
    try {
      // Get currency and residency from centralized providers
      final currencyCode = _ref.read(currencyProvider.notifier).currencyCode;
      final residencyCode = _ref.read(residencyProvider.notifier).currentOrDefault.code;

      final request = PropertyRequestDto(
        checkInDate: _formatDate(checkInDate),
        checkOutDate: _formatDate(checkOutDate),
        numberOfRooms: numberOfRooms,
        numberOfAdults: numberOfAdults,
        numberOfChildren: numberOfChildren,
        residency: residencyCode,
        currency: currencyCode,
      );

      final responseDto = await _api.fetchPropertyRooms(
        propertyId: propertyId,
        request: request,
      );

      return PropertyRoomsMapper.fromDto(responseDto);
    } catch (e) {
      // Re-throw ApiExceptions from the API layer
      rethrow;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
