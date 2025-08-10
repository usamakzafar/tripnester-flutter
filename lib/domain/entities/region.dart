import 'location.dart';

class Region {
  final String name;
  final String regionId;
  final String regionType;
  final int priority;
  final Location location;
  final String countryCode;
  final String countryName;

  const Region({
    required this.name,
    required this.regionId,
    required this.regionType,
    required this.priority,
    required this.location,
    required this.countryCode,
    required this.countryName,
  });
}
