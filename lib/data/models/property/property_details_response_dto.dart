import 'package:json_annotation/json_annotation.dart';

part 'property_details_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PropertyDetailsResponseDto {
  final bool isPropertyAvailable;
  final String id;
  final int hid;
  final String name;
  final String address;
  final GeoDto geo;
  final List<AmenityGroupDto> amenities;
  final double minPricePerNight;
  final bool hasDiscount;
  final num discountAmount;
  final bool cancellable;
  final String freeCancellationUntil; // ISO 8601
  final String currency;
  final String provider;
  final String? description;
  final String? propertyDetails;
  final String? generalRoomInfo;
  final List<PropertyImageDto> images;
  final String? checkInTime;
  final String? checkOutTime;
  final String? phone;
  final String? postalCode;
  final String kind;          // e.g. "Resort", "Hotel"
  final String starRating;    // keep as String per sample

  const PropertyDetailsResponseDto({
    required this.isPropertyAvailable,
    required this.id,
    required this.hid,
    required this.name,
    required this.address,
    required this.geo,
    required this.amenities,
    required this.minPricePerNight,
    required this.hasDiscount,
    required this.discountAmount,
    required this.cancellable,
    required this.freeCancellationUntil,
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

  factory PropertyDetailsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PropertyDetailsResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyDetailsResponseDtoToJson(this);
}

@JsonSerializable()
class GeoDto {
  final double lat;
  @JsonKey(name: 'long')
  final double lng;

  const GeoDto({required this.lat, required this.lng});

  factory GeoDto.fromJson(Map<String, dynamic> json) => _$GeoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GeoDtoToJson(this);
}

@JsonSerializable()
class AmenityGroupDto {
  final List<String> amenities;
  @JsonKey(name: 'non_free_amenities')
  final List<String> nonFreeAmenities;
  @JsonKey(name: 'group_name')
  final String groupName;

  const AmenityGroupDto({
    required this.amenities,
    required this.nonFreeAmenities,
    required this.groupName,
  });

  factory AmenityGroupDto.fromJson(Map<String, dynamic> json) =>
      _$AmenityGroupDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AmenityGroupDtoToJson(this);
}

@JsonSerializable()
class PropertyImageDto {
  final String url;                 // contains {size}
  @JsonKey(name: 'category_slug')
  final String categorySlug;

  const PropertyImageDto({required this.url, required this.categorySlug});

  factory PropertyImageDto.fromJson(Map<String, dynamic> json) =>
      _$PropertyImageDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyImageDtoToJson(this);
}
