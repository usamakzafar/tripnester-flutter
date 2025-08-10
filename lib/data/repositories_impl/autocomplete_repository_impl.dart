import '../../domain/repositories/autocomplete_repository.dart';
import '../../domain/entities/autocomplete_result.dart';
import '../datasources/remote/autocomplete_api.dart';

class AutocompleteRepositoryImpl implements AutocompleteRepository {
  final AutocompleteApi _autocompleteApi;

  AutocompleteRepositoryImpl(this._autocompleteApi);

  @override
  Future<AutocompleteResult> getSuggestions({required String query}) async {

    // Call AutocompleteApi.fetch
    final response = await _autocompleteApi.fetch(
      query: query,
    );

    // Map to domain
    final regions = response.regions.toDomain();
    final properties = response.properties.toDomain();
    return AutocompleteResult(regions: regions, properties: properties);
  }
}
