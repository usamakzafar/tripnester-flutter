import 'location.dart';

class PropertySuggestionItem {
  final String name;
  final int hid;
  final String regionId;
  final String regionType;
  final String regionName;
  final Location location;

  const PropertySuggestionItem({
    required this.name,
    required this.hid,
    required this.regionId,
    required this.regionType,
    required this.regionName,
    required this.location,
  });
}
