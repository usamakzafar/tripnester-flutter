import 'property_image.dart';

class SearchProperty {
  final String id;
  final int hid;
  final String name;
  final String address;
  final double lat;
  final double long;
  final List<String> amenities;
  final double minPricePerNight;
  final bool hasDiscount;
  final double discountAmount;
  final bool cancellable;
  final DateTime? freeCancellationUntil;
  final String currency;
  final String provider;
  final List<PropertyImage> images;
  final String kind;
  final String starRating;

  const SearchProperty({
    required this.id,
    required this.hid,
    required this.name,
    required this.address,
    required this.lat,
    required this.long,
    required this.amenities,
    required this.minPricePerNight,
    required this.hasDiscount,
    required this.discountAmount,
    required this.cancellable,
    this.freeCancellationUntil,
    required this.currency,
    required this.provider,
    required this.images,
    required this.kind,
    required this.starRating,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchProperty &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          hid == other.hid;

  @override
  int get hashCode => id.hashCode ^ hid.hashCode;

  @override
  String toString() {
    return 'SearchProperty{id: $id, name: $name, address: $address}';
  }
}
