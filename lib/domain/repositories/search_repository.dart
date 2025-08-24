import '../entities/search/search_response.dart';

abstract class SearchRepository {
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
  });
}
