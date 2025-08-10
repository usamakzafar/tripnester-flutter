import '../entities/autocomplete_result.dart';
import '../repositories/autocomplete_repository.dart';

class GetAutocompleteSuggestions {
  final AutocompleteRepository repo;

  GetAutocompleteSuggestions(this.repo);

  Future<AutocompleteResult> call({
    required String query,
    required DateTime checkIn,
    required DateTime checkOut,
    required int rooms,
    required int adults,
    required int children,
    required String residency,
  }) {
    // Validation:

    // 1) query.trim().length >= 2
    if (query.trim().length < 2) {
      throw ArgumentError('Query must be at least 2 characters long');
    }

    return repo.getSuggestions(
      query: query.trim(),
    );
  }
}
