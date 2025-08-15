// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRequestDto _$SearchRequestDtoFromJson(Map<String, dynamic> json) =>
    SearchRequestDto(
      checkInDate: json['checkInDate'] as String,
      checkOutDate: json['checkOutDate'] as String,
      numberOfRooms: (json['numberOfRooms'] as num).toInt(),
      numberOfAdults: (json['numberOfAdults'] as num).toInt(),
      numberOfChildren: (json['numberOfChildren'] as num).toInt(),
      residency: json['residency'] as String,
      filters:
          json['filters'] == null
              ? null
              : SearchFiltersDto.fromJson(
                json['filters'] as Map<String, dynamic>,
              ),
      currency: json['currency'] as String,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SearchRequestDtoToJson(SearchRequestDto instance) =>
    <String, dynamic>{
      'checkInDate': instance.checkInDate,
      'checkOutDate': instance.checkOutDate,
      'numberOfRooms': instance.numberOfRooms,
      'numberOfAdults': instance.numberOfAdults,
      'numberOfChildren': instance.numberOfChildren,
      'residency': instance.residency,
      'filters': instance.filters,
      'currency': instance.currency,
      'offset': instance.offset,
    };

SearchFiltersDto _$SearchFiltersDtoFromJson(Map<String, dynamic> json) =>
    SearchFiltersDto(
      starRating:
          (json['starRating'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList(),
    );

Map<String, dynamic> _$SearchFiltersDtoToJson(SearchFiltersDto instance) =>
    <String, dynamic>{'starRating': instance.starRating};
