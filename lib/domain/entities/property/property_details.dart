class PropertyDetails {
  final bool isPropertyAvailable;
  final String id;
  final int hid;
  final String name;
  final String address;
  final double lat;
  final double lng;
  final List<AmenityGroup> amenities;
  final double minPricePerNight;
  final bool hasDiscount;
  final num discountAmount;
  final bool cancellable;
  final DateTime? freeCancellationUntil;
  final String currency;
  final String provider;
  final String? description;
  final String? propertyDetails;
  final String? generalRoomInfo;
  final List<PropertyImage> images;
  final String? checkInTime;
  final String? checkOutTime;
  final String? phone;
  final String? postalCode;
  final String kind;
  final String starRating;

  const PropertyDetails({
    required this.isPropertyAvailable,
    required this.id,
    required this.hid,
    required this.name,
    required this.address,
    required this.lat,
    required this.lng,
    required this.amenities,
    required this.minPricePerNight,
    required this.hasDiscount,
    required this.discountAmount,
    required this.cancellable,
    this.freeCancellationUntil,
    required this.currency,
    required this.provider,
    this.description,
    this.propertyDetails,
    this.generalRoomInfo,
    required this.images,
    this.checkInTime,
    this.checkOutTime,
    this.phone,
    this.postalCode,
    required this.kind,
    required this.starRating,
  });
}

class AmenityGroup {
  final List<String> amenities;
  final List<String> nonFreeAmenities;
  final String groupName;

  const AmenityGroup({
    required this.amenities,
    required this.nonFreeAmenities,
    required this.groupName,
  });
}

class PropertyImage {
  final String url;
  final String categorySlug;

  const PropertyImage({
    required this.url,
    required this.categorySlug,
  });
}
