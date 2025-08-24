// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_details_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyDetailsResponseDto _$PropertyDetailsResponseDtoFromJson(
  Map<String, dynamic> json,
) => PropertyDetailsResponseDto(
  isPropertyAvailable: json['isPropertyAvailable'] as bool,
  id: json['id'] as String,
  hid: (json['hid'] as num).toInt(),
  name: json['name'] as String,
  address: json['address'] as String,
  geo: GeoDto.fromJson(json['geo'] as Map<String, dynamic>),
  amenities:
      (json['amenities'] as List<dynamic>)
          .map((e) => AmenityGroupDto.fromJson(e as Map<String, dynamic>))
          .toList(),
  minPricePerNight: (json['minPricePerNight'] as num).toDouble(),
  hasDiscount: json['hasDiscount'] as bool,
  discountAmount: json['discountAmount'] as num,
  cancellable: json['cancellable'] as bool,
  freeCancellationUntil: json['freeCancellationUntil'] as String,
  currency: json['currency'] as String,
  provider: json['provider'] as String,
  description: json['description'] as String?,
  propertyDetails: json['propertyDetails'] as String?,
  generalRoomInfo: json['generalRoomInfo'] as String?,
  images:
      (json['images'] as List<dynamic>)
          .map((e) => PropertyImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
  checkInTime: json['checkInTime'] as String?,
  checkOutTime: json['checkOutTime'] as String?,
  phone: json['phone'] as String?,
  postalCode: json['postalCode'] as String?,
  kind: json['kind'] as String,
  starRating: json['starRating'] as String,
);

Map<String, dynamic> _$PropertyDetailsResponseDtoToJson(
  PropertyDetailsResponseDto instance,
) => <String, dynamic>{
  'isPropertyAvailable': instance.isPropertyAvailable,
  'id': instance.id,
  'hid': instance.hid,
  'name': instance.name,
  'address': instance.address,
  'geo': instance.geo.toJson(),
  'amenities': instance.amenities.map((e) => e.toJson()).toList(),
  'minPricePerNight': instance.minPricePerNight,
  'hasDiscount': instance.hasDiscount,
  'discountAmount': instance.discountAmount,
  'cancellable': instance.cancellable,
  'freeCancellationUntil': instance.freeCancellationUntil,
  'currency': instance.currency,
  'provider': instance.provider,
  'description': instance.description,
  'propertyDetails': instance.propertyDetails,
  'generalRoomInfo': instance.generalRoomInfo,
  'images': instance.images.map((e) => e.toJson()).toList(),
  'checkInTime': instance.checkInTime,
  'checkOutTime': instance.checkOutTime,
  'phone': instance.phone,
  'postalCode': instance.postalCode,
  'kind': instance.kind,
  'starRating': instance.starRating,
};

GeoDto _$GeoDtoFromJson(Map<String, dynamic> json) => GeoDto(
  lat: (json['lat'] as num).toDouble(),
  lng: (json['long'] as num).toDouble(),
);

Map<String, dynamic> _$GeoDtoToJson(GeoDto instance) => <String, dynamic>{
  'lat': instance.lat,
  'long': instance.lng,
};

AmenityGroupDto _$AmenityGroupDtoFromJson(Map<String, dynamic> json) =>
    AmenityGroupDto(
      amenities:
          (json['amenities'] as List<dynamic>).map((e) => e as String).toList(),
      nonFreeAmenities:
          (json['non_free_amenities'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      groupName: json['group_name'] as String,
    );

Map<String, dynamic> _$AmenityGroupDtoToJson(AmenityGroupDto instance) =>
    <String, dynamic>{
      'amenities': instance.amenities,
      'non_free_amenities': instance.nonFreeAmenities,
      'group_name': instance.groupName,
    };

PropertyImageDto _$PropertyImageDtoFromJson(Map<String, dynamic> json) =>
    PropertyImageDto(
      url: json['url'] as String,
      categorySlug: json['category_slug'] as String,
    );

Map<String, dynamic> _$PropertyImageDtoToJson(PropertyImageDto instance) =>
    <String, dynamic>{
      'url': instance.url,
      'category_slug': instance.categorySlug,
    };
