import 'package:json_annotation/json_annotation.dart';

part 'property_rooms_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PropertyRoomsResponseDto {
  final String id;
  final int hid;
  final List<RoomOptionDto> roomsData;
  final String currency;

  const PropertyRoomsResponseDto({
    required this.id,
    required this.hid,
    required this.roomsData,
    required this.currency,
  });

  factory PropertyRoomsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PropertyRoomsResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyRoomsResponseDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RoomOptionDto {
  final String roomPreBookId;
  final List<String> amenities;
  final double minNightRate;
  final bool includesBreakfast;
  final String beddingType;
  final bool hasBalcony;
  final double totalAmount;
  final List<TaxDto> includedTaxes;
  final List<TaxDto> nonIncludedTaxes;
  final bool cancellable;
  final String cancellableUntil; // ISO
  final String name;
  final List<String> images;

  const RoomOptionDto({
    required this.roomPreBookId,
    required this.amenities,
    required this.minNightRate,
    required this.includesBreakfast,
    required this.beddingType,
    required this.hasBalcony,
    required this.totalAmount,
    required this.includedTaxes,
    required this.nonIncludedTaxes,
    required this.cancellable,
    required this.cancellableUntil,
    required this.name,
    required this.images,
  });

  factory RoomOptionDto.fromJson(Map<String, dynamic> json) =>
      _$RoomOptionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RoomOptionDtoToJson(this);
}

@JsonSerializable()
class TaxDto {
  final String type;
  final String amount;  // keep as String per sample
  final String currency;

  const TaxDto({required this.type, required this.amount, required this.currency});

  factory TaxDto.fromJson(Map<String, dynamic> json) => _$TaxDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TaxDtoToJson(this);
}
