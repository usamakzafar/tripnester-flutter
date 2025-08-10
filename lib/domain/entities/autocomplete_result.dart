import 'autocomplete_regions.dart';
import 'autocomplete_property_result.dart';

class AutocompleteResult {
  final AutocompleteRegions regions;
  final AutocompletePropertyResult properties;

  const AutocompleteResult({
    required this.regions,
    required this.properties,
  });
}
