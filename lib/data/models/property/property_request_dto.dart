import 'package:json_annotation/json_annotation.dart';

part 'property_request_dto.g.dart';

@JsonSerializable()
class PropertyRequestDto {
  final String checkInDate;     // 'YYYY-MM-DD'
  final String checkOutDate;    // 'YYYY-MM-DD'
  final int numberOfRooms;
  final int numberOfAdults;
  final int numberOfChildren;
  final String residency;       // from residencyProvider
  final String currency;        // from currencyProvider

  const PropertyRequestDto({
    required this.checkInDate,
    required this.checkOutDate,
    required this.numberOfRooms,
    required this.numberOfAdults,
    required this.numberOfChildren,
    required this.residency,
    required this.currency,
  });

  factory PropertyRequestDto.fromJson(Map<String, dynamic> json) =>
      _$PropertyRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyRequestDtoToJson(this);
}
