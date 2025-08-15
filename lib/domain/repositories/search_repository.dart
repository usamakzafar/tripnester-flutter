import '../entities/search/search_response.dart';

abstract class SearchRepository {
  Future<SearchResponse> searchProperties({
    required String regionId,
    required String checkInDate,
    required String checkOutDate,
    required int numberOfRooms,
    required int numberOfAdults,
    required int numberOfChildren,
    required String residency,
    List<int>? starRatings,
    required String currency,
    int offset = 0,
  });
}
