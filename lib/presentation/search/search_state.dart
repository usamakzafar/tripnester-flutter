import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/search/search_property.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(<SearchProperty>[]) List<SearchProperty> items,
    int? nextOffset,              // from response.nextPropertyOffset
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    String? errorMessage,

    // Keep the last successful query params (excluding offset) so we can call loadMore()
    required String regionId,
    required String checkInDate,
    required String checkOutDate,
    required int numberOfRooms,
    required int numberOfAdults,
    required int numberOfChildren,
    required String residency,
    List<int>? starRatings,
    required String currency,
  }) = _SearchState;

  // Provide a lightweight initial factory that sets requireds with sensible defaults.
  factory SearchState.initial() => const SearchState(
    items: [],
    nextOffset: null,
    isLoading: false,
    isLoadingMore: false,
    errorMessage: null,
    regionId: '',
    checkInDate: '',
    checkOutDate: '',
    numberOfRooms: 1,
    numberOfAdults: 2,
    numberOfChildren: 0,
    residency: 'us',
    starRatings: null,
    currency: 'USD',
  );
}
