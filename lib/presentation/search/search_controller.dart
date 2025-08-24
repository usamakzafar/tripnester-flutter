import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'search_state.dart';
import '../../domain/repositories/search_repository.dart';
import '../../core/di/injection_container.dart';

class SearchController extends AsyncNotifier<SearchState> {
  late final SearchRepository _repo;

  @override
  Future<SearchState> build() async {
    _repo = ref.read(searchRepositoryProvider);
    // Start empty
    return SearchState.initial();
  }

  // Initial search (refresh)
  Future<void> search({
    required String regionId,
    required String checkInDate,
    required String checkOutDate,
    required int numberOfRooms,
    required int numberOfAdults,
    required int numberOfChildren,
    required String residency,
    List<int>? starRatings,
  }) async {
    if (state.value?.isLoading == true) return;
    state = AsyncData(state.value!.copyWith(isLoading: true, errorMessage: null));
    try {
      final res = await _repo.searchProperties(
        regionId: regionId,
        checkInDate: checkInDate,
        checkOutDate: checkOutDate,
        numberOfRooms: numberOfRooms,
        numberOfAdults: numberOfAdults,
        numberOfChildren: numberOfChildren,
        starRatings: starRatings,
        offset: 0,
      );

      state = AsyncData(
        state.value!.copyWith(
          items: res.properties,
          nextOffset: res.nextPropertyOffset,
          isLoading: false,
          isLoadingMore: false,
          errorMessage: null,
          regionId: regionId,
          checkInDate: checkInDate,
          checkOutDate: checkOutDate,
          numberOfRooms: numberOfRooms,
          numberOfAdults: numberOfAdults,
          numberOfChildren: numberOfChildren,
          residency: residency,
          starRatings: starRatings,
          currency: 'EUR', // Default since currency is now handled automatically
        ),
      );
    } catch (e) {
      state = AsyncData(
        state.value!.copyWith(
          isLoading: false,
          isLoadingMore: false,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }

  // Pagination
  Future<void> loadMore() async {
    final current = state.value!;
    if (current.isLoadingMore || current.isLoading) return;
    final nextOffset = current.nextOffset;
    if (nextOffset == null) return; // no more pages

    state = AsyncData(current.copyWith(isLoadingMore: true, errorMessage: null));
    try {
      final res = await _repo.searchProperties(
        regionId: current.regionId,
        checkInDate: current.checkInDate,
        checkOutDate: current.checkOutDate,
        numberOfRooms: current.numberOfRooms,
        numberOfAdults: current.numberOfAdults,
        numberOfChildren: current.numberOfChildren,
        starRatings: current.starRatings,
        offset: nextOffset,
      );

      state = AsyncData(
        state.value!.copyWith(
          items: [...current.items, ...res.properties],
          nextOffset: res.nextPropertyOffset, // may be null or an int
          isLoadingMore: false,
          errorMessage: null,
        ),
      );
    } catch (e) {
      state = AsyncData(current.copyWith(isLoadingMore: false, errorMessage: e.toString()));
      rethrow;
    }
  }

  void reset() {
    state = AsyncData(SearchState.initial());
  }
}

// Provider for the SearchController
final searchControllerProvider = AsyncNotifierProvider<SearchController, SearchState>(
  () => SearchController(),
);
