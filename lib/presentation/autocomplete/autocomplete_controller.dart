import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/autocomplete_result.dart';
import '../../domain/usecases/get_autocomplete_suggestions.dart';
import '../../core/di/injection_container.dart';

class AutocompleteController extends AutoDisposeAsyncNotifier<AutocompleteResult?> {
  late GetAutocompleteSuggestions _getAutocompleteSuggestions;
  Timer? _debounceTimer;

  @override
  FutureOr<AutocompleteResult?> build() {
    _getAutocompleteSuggestions = ref.read(getAutocompleteSuggestionsProvider);
    return null; // Initial state is null
  }

  Future<void> fetchSuggestions({
    required String query,
    required DateTime checkIn,
    required DateTime checkOut,
    required int rooms,
    required int adults,
    required int children,
    required String residency,
    bool debounce = true,
  }) async {
    // Cancel any existing debounce timer
    _debounceTimer?.cancel();

    if (debounce && query.trim().length >= 2) {
      // Debounce for 300ms
      _debounceTimer = Timer(const Duration(milliseconds: 300), () {
        _performFetch(
          query: query,
          checkIn: checkIn,
          checkOut: checkOut,
          rooms: rooms,
          adults: adults,
          children: children,
          residency: residency,
        );
      });
    } else if (!debounce) {
      // Immediate fetch without debounce
      await _performFetch(
        query: query,
        checkIn: checkIn,
        checkOut: checkOut,
        rooms: rooms,
        adults: adults,
        children: children,
        residency: residency,
      );
    } else {
      // Query is too short, clear results
      state = const AsyncValue.data(null);
    }
  }

  Future<void> _performFetch({
    required String query,
    required DateTime checkIn,
    required DateTime checkOut,
    required int rooms,
    required int adults,
    required int children,
    required String residency,
  }) async {
    state = const AsyncValue.loading();

    try {
      final result = await _getAutocompleteSuggestions.call(
        query: query,
        checkIn: checkIn,
        checkOut: checkOut,
        rooms: rooms,
        adults: adults,
        children: children,
        residency: residency,
      );
      state = AsyncValue.data(result);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void clearResults() {
    _debounceTimer?.cancel();
    state = const AsyncValue.data(null);
  }
}
