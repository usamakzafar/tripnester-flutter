import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tripnester/core/di/injection_container.dart';
import 'package:tripnester/domain/entities/search/search_property.dart';
import 'package:tripnester/domain/repositories/search_repository.dart';

// Sort options
enum SortOrder { recommended, price, rating }

// Filters applied to listings
class AppliedFilters {
  final List<int> starRating; // e.g., [3,4,5]
  final bool hasDeal; // maps to property.hasDiscount
  final bool freeCancel; // maps to property.cancellable

  const AppliedFilters({
    this.starRating = const [],
    this.hasDeal = false,
    this.freeCancel = false,
  });

  AppliedFilters copyWith({
    List<int>? starRating,
    bool? hasDeal,
    bool? freeCancel,
  }) => AppliedFilters(
        starRating: starRating ?? this.starRating,
        hasDeal: hasDeal ?? this.hasDeal,
        freeCancel: freeCancel ?? this.freeCancel,
      );
}

class ListingsState {
  final bool isLoading;
  final bool isLoadingMore;
  final String? error;
  final List<SearchProperty> items;
  final int? nextOffset;
  final AppliedFilters filters;
  final SortOrder sort;

  const ListingsState({
    this.isLoading = true,
    this.isLoadingMore = false,
    this.error,
    this.items = const [],
    this.nextOffset,
    this.filters = const AppliedFilters(),
    this.sort = SortOrder.recommended,
  });

  ListingsState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    String? error,
    List<SearchProperty>? items,
    int? nextOffset,
    AppliedFilters? filters,
    SortOrder? sort,
    bool clearError = false,
  }) => ListingsState(
        isLoading: isLoading ?? this.isLoading,
        isLoadingMore: isLoadingMore ?? this.isLoadingMore,
        error: clearError ? null : (error ?? this.error),
        items: items ?? this.items,
        nextOffset: nextOffset ?? this.nextOffset,
        filters: filters ?? this.filters,
        sort: sort ?? this.sort,
      );
}

class ListingsController extends AsyncNotifier<ListingsState> {
  late final SearchRepository _repo;

  // Keep last successful params to support filter/sort refreshes
  String? _regionId;
  DateTime? _checkIn;
  DateTime? _checkOut;
  int _rooms = 1;
  int _adults = 2;
  int _children = 0;
  List<int>? _childrenAges;

  // Simple request token to ignore stale responses
  int _requestToken = 0;

  @override
  Future<ListingsState> build() async {
    _repo = ref.read(searchRepositoryProvider);
    return const ListingsState();
  }

  Future<void> loadInitial({
    required String regionId,
    required DateTime checkIn,
    required DateTime checkOut,
    required int rooms,
    required int adults,
    required int children,
    List<int>? childrenAges,
  }) async {
    // Save params (currency and residency are now handled automatically)
    _regionId = regionId;
    _checkIn = checkIn;
    _checkOut = checkOut;
    _rooms = rooms;
    _adults = adults;
    _children = children;
    _childrenAges = childrenAges;

    final token = ++_requestToken;

    // Start loading
    final current = state.value ?? const ListingsState();
    state = AsyncData(current.copyWith(isLoading: true, isLoadingMore: false, items: const [], clearError: true));

    try {
      final filters = current.filters;
      final res = await _repo.searchProperties(
        regionId: regionId,
        checkInDate: checkIn.toIso8601String(),
        checkOutDate: checkOut.toIso8601String(),
        numberOfRooms: rooms,
        numberOfAdults: adults,
        numberOfChildren: children,
        starRatings: filters.starRating.isNotEmpty ? filters.starRating : null,
        offset: 0,
        children: childrenAges,
      );

      // Ignore stale responses
      if (token != _requestToken) return;

      // Apply local-only filters and sorting (deals/cancellation, sort)
      var items = _applyLocalFilters(res.properties, filters);
      items = _applySort(items, current.sort);

      state = AsyncData(
        (state.value ?? const ListingsState()).copyWith(
          isLoading: false,
          items: items,
          nextOffset: res.nextPropertyOffset,
          clearError: true,
        ),
      );
    } catch (e) {
      // Ignore stale
      if (token != _requestToken) return;
      state = AsyncData(
        (state.value ?? const ListingsState()).copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
      rethrow;
    }
  }

  Future<void> loadMore() async {
    final s = state.value ?? const ListingsState();
    if (s.isLoadingMore || s.isLoading) return;
    final next = s.nextOffset;
    if (next == null || _regionId == null || _checkIn == null || _checkOut == null) return;

    state = AsyncData(s.copyWith(isLoadingMore: true, clearError: true));
    try {
      final res = await _repo.searchProperties(
        regionId: _regionId!,
        checkInDate: _checkIn!.toIso8601String(),
        checkOutDate: _checkOut!.toIso8601String(),
        numberOfRooms: _rooms,
        numberOfAdults: _adults,
        numberOfChildren: _children,
        starRatings: s.filters.starRating.isEmpty ? null : s.filters.starRating,
        offset: next,
        children: _childrenAges,
      );

      var combined = [...s.items, ...res.properties];
      combined = _applyLocalFilters(combined, s.filters);
      combined = _applySort(combined, s.sort);

      state = AsyncData(
        (state.value ?? const ListingsState()).copyWith(
          isLoadingMore: false,
          items: combined,
          nextOffset: res.nextPropertyOffset,
          clearError: true,
        ),
      );
    } catch (e) {
      state = AsyncData(s.copyWith(isLoadingMore: false, error: e.toString()));
      rethrow;
    }
  }

  void updateFilters({ List<int>? starRating, bool? hasDeal, bool? freeCancel }) {
    final s = state.value ?? const ListingsState();
    final newFilters = s.filters.copyWith(
      starRating: starRating ?? s.filters.starRating,
      hasDeal: hasDeal ?? s.filters.hasDeal,
      freeCancel: freeCancel ?? s.filters.freeCancel,
    );
    state = AsyncData(s.copyWith(filters: newFilters));

    // Re-fetch with last params
    final regionId = _regionId;
    final checkIn = _checkIn;
    final checkOut = _checkOut;
    if (regionId != null && checkIn != null && checkOut != null) {
      loadInitial(
        regionId: regionId,
        checkIn: checkIn,
        checkOut: checkOut,
        rooms: _rooms,
        adults: _adults,
        children: _children,
        childrenAges: _childrenAges,
      );
    }
  }

  void updateSort(SortOrder order) {
    final s = state.value ?? const ListingsState();
    if (s.sort == order) return;

    // Update sort and re-fetch (or locally sort existing items)
    final sorted = _applySort([...s.items], order);
    state = AsyncData(s.copyWith(sort: order, items: sorted));

    final regionId = _regionId;
    final checkIn = _checkIn;
    final checkOut = _checkOut;
    if (regionId != null && checkIn != null && checkOut != null) {
      loadInitial(
        regionId: regionId,
        checkIn: checkIn,
        checkOut: checkOut,
        rooms: _rooms,
        adults: _adults,
        children: _children,
        childrenAges: _childrenAges,
      );
    }
  }

  List<SearchProperty> _applyLocalFilters(List<SearchProperty> input, AppliedFilters f) {
    return input.where((p) {
      if (f.hasDeal && !p.hasDiscount) return false;
      if (f.freeCancel && !p.cancellable) return false;
      return true;
    }).toList(growable: false);
  }

  List<SearchProperty> _applySort(List<SearchProperty> list, SortOrder order) {
    switch (order) {
      case SortOrder.recommended:
        return list; // keep server ordering
      case SortOrder.price:
        list.sort((a, b) => a.minPricePerNight.compareTo(b.minPricePerNight));
        return list;
      case SortOrder.rating:
        // starRating is a String per domain; try parse to double, higher first
        int parse(String s) => int.tryParse(s) ?? 0;
        list.sort((a, b) => parse(b.starRating).compareTo(parse(a.starRating)));
        return list;
    }
  }
}

final listingsControllerProvider = AsyncNotifierProvider<ListingsController, ListingsState>(
  ListingsController.new,
);
