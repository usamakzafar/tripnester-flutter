import '../entities/search_result_item.dart';

abstract class PropertiesRepository {
  Future<List<SearchResultItem>> searchByName(String name);
}
