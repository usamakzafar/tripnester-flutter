import 'search_property.dart';

class SearchResponse {
  final int nextPropertyOffset;
  final List<SearchProperty> properties;

  const SearchResponse({
    required this.nextPropertyOffset,
    required this.properties,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchResponse &&
          runtimeType == other.runtimeType &&
          nextPropertyOffset == other.nextPropertyOffset &&
          properties == other.properties;

  @override
  int get hashCode => nextPropertyOffset.hashCode ^ properties.hashCode;

  @override
  String toString() {
    return 'SearchResponse{nextPropertyOffset: $nextPropertyOffset, properties: ${properties.length} items}';
  }
}
