import 'package:tripnester/domain/entities/search/search_property.dart';

class RegionPropertiesPage {
  final List<SearchProperty> properties;
  final int? nextPropertyOffset;

  const RegionPropertiesPage({
    required this.properties,
    required this.nextPropertyOffset,
  });
}

