import '../entities/autocomplete_result.dart';

abstract class AutocompleteRepository {
  Future<AutocompleteResult> getSuggestions({
    required String query
  });
}
