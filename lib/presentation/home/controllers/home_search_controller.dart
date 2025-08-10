import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/region.dart';
import '../../../domain/entities/property_suggestion_item.dart';
import '../../../core/di/injection_container.dart';

part 'home_search_controller.freezed.dart';
part 'home_search_controller.g.dart';

// Union type for autocomplete suggestions
@freezed
sealed class AutocompleteSuggestion with _$AutocompleteSuggestion {
  const factory AutocompleteSuggestion.region(Region region) = RegionSuggestion;
  const factory AutocompleteSuggestion.property(PropertySuggestionItem property) = PropertySuggestion;
}

@freezed
class HomeSearchState with _$HomeSearchState {
  const factory HomeSearchState({
    @Default('') String locationText,
    DateTimeRange? stayRange,
    @Default(2) int adults,
    @Default(0) int children,
    @Default(false) bool isAutocompleteOpen,
    @Default([]) List<AutocompleteSuggestion> suggestions,
  }) = _HomeSearchState;
}

@riverpod
class HomeSearchController extends _$HomeSearchController {
  Timer? _debounceTimer;

  @override
  Future<HomeSearchState> build() async {
    return const HomeSearchState();
  }

  void setLocationText(String text) async {
    final trimmedText = text.trim();

    // Cancel previous timer
    _debounceTimer?.cancel();

    // Update location text immediately
    final currentState = state.valueOrNull ?? const HomeSearchState();
    state = AsyncValue.data(currentState.copyWith(
      locationText: text,
    ));

    if (trimmedText.length >= 3) {
      // Debounce autocomplete call
      _debounceTimer = Timer(const Duration(milliseconds: 300), () {
        _fetchAutocomplete(trimmedText);
      });
    } else {
      // Clear suggestions and close popup
      state = AsyncValue.data(currentState.copyWith(
        locationText: text,
        suggestions: [],
        isAutocompleteOpen: false,
      ));
    }
  }

  void setLocationTextWithoutAutocomplete(String text) {
    final currentState = state.valueOrNull ?? const HomeSearchState();

    // Cancel any pending autocomplete
    _debounceTimer?.cancel();

    // Update location text and close autocomplete
    state = AsyncValue.data(currentState.copyWith(
      locationText: text,
      suggestions: [],
      isAutocompleteOpen: false,
    ));
  }

  Future<void> _fetchAutocomplete(String query) async {
    try {
      final currentState = state.valueOrNull ?? const HomeSearchState();

      // Use default values for required parameters
      final now = DateTime.now();
      final checkIn = currentState.stayRange?.start ?? now.add(const Duration(days: 1));
      final checkOut = currentState.stayRange?.end ?? now.add(const Duration(days: 2));

      final getAutocompleteSuggestions = ref.read(getAutocompleteSuggestionsProvider);
      final result = await getAutocompleteSuggestions.call(
        query: query,
        checkIn: checkIn,
        checkOut: checkOut,
        rooms: 1,
        adults: currentState.adults,
        children: currentState.children,
        residency: 'US', // Default residency
      );

      // Convert results to suggestions
      final suggestions = <AutocompleteSuggestion>[
        ...result.regions.results.map((region) => AutocompleteSuggestion.region(region)),
        ...result.properties.results.map((property) => AutocompleteSuggestion.property(property)),
      ];

      state = AsyncValue.data(currentState.copyWith(
        suggestions: suggestions,
        isAutocompleteOpen: suggestions.isNotEmpty,
      ));
    } catch (error) {
      log('Autocomplete error: $error');
      // Don't update state on error, keep current suggestions
    }
  }

  void setDateRange(DateTimeRange? dateRange) {
    final currentState = state.valueOrNull ?? const HomeSearchState();
    state = AsyncValue.data(currentState.copyWith(stayRange: dateRange));
  }

  void setAdults(int adults) {
    if (adults < 1) return; // Minimum 1 adult
    final currentState = state.valueOrNull ?? const HomeSearchState();
    state = AsyncValue.data(currentState.copyWith(adults: adults));
  }

  void setChildren(int children) {
    if (children < 0) return; // Minimum 0 children
    final currentState = state.valueOrNull ?? const HomeSearchState();
    state = AsyncValue.data(currentState.copyWith(children: children));
  }

  void submit() {
    final currentState = state.valueOrNull ?? const HomeSearchState();
    log('Search submitted with:');
    log('Location: ${currentState.locationText}');
    log('Stay Range: ${currentState.stayRange}');
    log('Adults: ${currentState.adults}');
    log('Children: ${currentState.children}');
    // TODO: Navigate to search results
  }

  void closeSuggestions() {
    final currentState = state.valueOrNull ?? const HomeSearchState();
    state = AsyncValue.data(currentState.copyWith(isAutocompleteOpen: false));
  }

  void dispose() {
    _debounceTimer?.cancel();
  }
}
