import 'package:json_annotation/json_annotation.dart';
import 'property_image_dto.dart';
import '../../../domain/entities/search/search_property.dart';

part 'search_property_dto.g.dart';

@JsonSerializable()
class SearchPropertyDto {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'hid')
  final int hid;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'address')
  final String address;

  @JsonKey(name: 'geo')
  final PropertyGeoDto geo;

  @JsonKey(name: 'amenities')
  final List<String> amenities;

  @JsonKey(name: 'minPricePerNight')
  final double minPricePerNight;

  @JsonKey(name: 'hasDiscount')
  final bool hasDiscount;

  @JsonKey(name: 'discountAmount')
  final double discountAmount;

  @JsonKey(name: 'cancellable')
  final bool cancellable;

  @JsonKey(name: 'freeCancellationUntil')
  final DateTime? freeCancellationUntil;

  @JsonKey(name: 'currency')
  final String currency;

  @JsonKey(name: 'provider')
  final String provider;

  @JsonKey(name: 'images')
  final List<PropertyImageDto> images;

  @JsonKey(name: 'kind')
  final String kind;

  @JsonKey(name: 'starRating')
  final String starRating;

  const SearchPropertyDto({
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
    this.freeCancellationUntil,
    required this.currency,
    required this.provider,
    required this.images,
    required this.kind,
    required this.starRating,
  });

  factory SearchPropertyDto.fromJson(Map<String, dynamic> json) =>
      _$SearchPropertyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPropertyDtoToJson(this);

  SearchProperty toDomain() {
    return SearchProperty(
      id: id,
      hid: hid,
      name: name,
      address: address,
      lat: geo.lat,
      long: geo.long,
      amenities: amenities,
      minPricePerNight: minPricePerNight,
      hasDiscount: hasDiscount,
      discountAmount: discountAmount,
      cancellable: cancellable,
      freeCancellationUntil: freeCancellationUntil,
      currency: currency,
      provider: provider,
      images: images.map((img) => img.toDomain()).toList(),
      kind: kind,
      starRating: starRating,
    );
  }
}

@JsonSerializable()
class PropertyGeoDto {
  @JsonKey(name: 'lat')
  final double lat;

  @JsonKey(name: 'long')
  final double long;

  const PropertyGeoDto({
    required this.lat,
    required this.long,
  });

  factory PropertyGeoDto.fromJson(Map<String, dynamic> json) =>
      _$PropertyGeoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyGeoDtoToJson(this);
}
