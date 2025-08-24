// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyRequestDto _$PropertyRequestDtoFromJson(Map<String, dynamic> json) =>
    PropertyRequestDto(
      checkInDate: json['checkInDate'] as String,
      checkOutDate: json['checkOutDate'] as String,
      numberOfRooms: (json['numberOfRooms'] as num).toInt(),
      numberOfAdults: (json['numberOfAdults'] as num).toInt(),
      numberOfChildren: (json['numberOfChildren'] as num).toInt(),
      residency: json['residency'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$PropertyRequestDtoToJson(PropertyRequestDto instance) =>
    <String, dynamic>{
      'checkInDate': instance.checkInDate,
      'checkOutDate': instance.checkOutDate,
      'numberOfRooms': instance.numberOfRooms,
      'numberOfAdults': instance.numberOfAdults,
      'numberOfChildren': instance.numberOfChildren,
      'residency': instance.residency,
      'currency': instance.currency,
    };
