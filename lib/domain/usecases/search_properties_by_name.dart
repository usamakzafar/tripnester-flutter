import '../entities/search_result_item.dart';
import '../repositories/properties_repository.dart';

class SearchPropertiesByName {
  final PropertiesRepository propertiesRepository;

  SearchPropertiesByName(this.propertiesRepository);

  Future<List<SearchResultItem>> call(String name) {
    return propertiesRepository.searchByName(name);
  }
}
