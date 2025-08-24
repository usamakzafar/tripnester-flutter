// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_rooms_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyRoomsResponseDto _$PropertyRoomsResponseDtoFromJson(
  Map<String, dynamic> json,
) => PropertyRoomsResponseDto(
  id: json['id'] as String,
  hid: (json['hid'] as num).toInt(),
  roomsData:
      (json['roomsData'] as List<dynamic>)
          .map((e) => RoomOptionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
  currency: json['currency'] as String,
);

Map<String, dynamic> _$PropertyRoomsResponseDtoToJson(
  PropertyRoomsResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'hid': instance.hid,
  'roomsData': instance.roomsData.map((e) => e.toJson()).toList(),
  'currency': instance.currency,
};

RoomOptionDto _$RoomOptionDtoFromJson(Map<String, dynamic> json) =>
    RoomOptionDto(
      roomPreBookId: json['roomPreBookId'] as String,
      amenities:
          (json['amenities'] as List<dynamic>).map((e) => e as String).toList(),
      minNightRate: (json['minNightRate'] as num).toDouble(),
      includesBreakfast: json['includesBreakfast'] as bool,
      beddingType: json['beddingType'] as String,
      hasBalcony: json['hasBalcony'] as bool,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      includedTaxes:
          (json['includedTaxes'] as List<dynamic>)
              .map((e) => TaxDto.fromJson(e as Map<String, dynamic>))
              .toList(),
      nonIncludedTaxes:
          (json['nonIncludedTaxes'] as List<dynamic>)
              .map((e) => TaxDto.fromJson(e as Map<String, dynamic>))
              .toList(),
      cancellable: json['cancellable'] as bool,
      cancellableUntil: json['cancellableUntil'] as String,
      name: json['name'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RoomOptionDtoToJson(
  RoomOptionDto instance,
) => <String, dynamic>{
  'roomPreBookId': instance.roomPreBookId,
  'amenities': instance.amenities,
  'minNightRate': instance.minNightRate,
  'includesBreakfast': instance.includesBreakfast,
  'beddingType': instance.beddingType,
  'hasBalcony': instance.hasBalcony,
  'totalAmount': instance.totalAmount,
  'includedTaxes': instance.includedTaxes.map((e) => e.toJson()).toList(),
  'nonIncludedTaxes': instance.nonIncludedTaxes.map((e) => e.toJson()).toList(),
  'cancellable': instance.cancellable,
  'cancellableUntil': instance.cancellableUntil,
  'name': instance.name,
  'images': instance.images,
};

TaxDto _$TaxDtoFromJson(Map<String, dynamic> json) => TaxDto(
  type: json['type'] as String,
  amount: json['amount'] as String,
  currency: json['currency'] as String,
);

Map<String, dynamic> _$TaxDtoToJson(TaxDto instance) => <String, dynamic>{
  'type': instance.type,
  'amount': instance.amount,
  'currency': instance.currency,
};
