// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_property_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPropertyDto _$SearchPropertyDtoFromJson(Map<String, dynamic> json) =>
    SearchPropertyDto(
      id: json['id'] as String,
      hid: (json['hid'] as num).toInt(),
      name: json['name'] as String,
      address: json['address'] as String,
      geo: PropertyGeoDto.fromJson(json['geo'] as Map<String, dynamic>),
      amenities:
          (json['amenities'] as List<dynamic>).map((e) => e as String).toList(),
      minPricePerNight: (json['minPricePerNight'] as num).toDouble(),
      hasDiscount: json['hasDiscount'] as bool,
      discountAmount: (json['discountAmount'] as num).toDouble(),
      cancellable: json['cancellable'] as bool,
      freeCancellationUntil:
          json['freeCancellationUntil'] == null
              ? null
              : DateTime.parse(json['freeCancellationUntil'] as String),
      currency: json['currency'] as String,
      provider: json['provider'] as String,
      images:
          (json['images'] as List<dynamic>)
              .map((e) => PropertyImageDto.fromJson(e as Map<String, dynamic>))
              .toList(),
      kind: json['kind'] as String,
      starRating: json['starRating'] as String,
    );

Map<String, dynamic> _$SearchPropertyDtoToJson(
  SearchPropertyDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'hid': instance.hid,
  'name': instance.name,
  'address': instance.address,
  'geo': instance.geo,
  'amenities': instance.amenities,
  'minPricePerNight': instance.minPricePerNight,
  'hasDiscount': instance.hasDiscount,
  'discountAmount': instance.discountAmount,
  'cancellable': instance.cancellable,
  'freeCancellationUntil': instance.freeCancellationUntil?.toIso8601String(),
  'currency': instance.currency,
  'provider': instance.provider,
  'images': instance.images,
  'kind': instance.kind,
  'starRating': instance.starRating,
};

PropertyGeoDto _$PropertyGeoDtoFromJson(Map<String, dynamic> json) =>
    PropertyGeoDto(
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
    );

Map<String, dynamic> _$PropertyGeoDtoToJson(PropertyGeoDto instance) =>
    <String, dynamic>{'lat': instance.lat, 'long': instance.long};
