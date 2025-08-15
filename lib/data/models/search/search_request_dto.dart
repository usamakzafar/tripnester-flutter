import 'package:json_annotation/json_annotation.dart';

part 'search_request_dto.g.dart';

@JsonSerializable()
class SearchRequestDto {
  @JsonKey(name: 'checkInDate')
  final String checkInDate; // ISO8601 format

  @JsonKey(name: 'checkOutDate')
  final String checkOutDate; // ISO8601 format

  @JsonKey(name: 'numberOfRooms')
  final int numberOfRooms;

  @JsonKey(name: 'numberOfAdults')
  final int numberOfAdults;

  @JsonKey(name: 'numberOfChildren')
  final int numberOfChildren;

  @JsonKey(name: 'residency')
  final String residency;

  @JsonKey(name: 'filters')
  final SearchFiltersDto? filters;

  @JsonKey(name: 'currency')
  final String currency;

  @JsonKey(name: 'offset')
  final int offset;

  const SearchRequestDto({
    required this.checkInDate,
    required this.checkOutDate,
    required this.numberOfRooms,
    required this.numberOfAdults,
    required this.numberOfChildren,
    required this.residency,
    this.filters,
    required this.currency,
    this.offset = 0,
  });

  factory SearchRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchRequestDtoToJson(this);
}

@JsonSerializable()
class SearchFiltersDto {
  @JsonKey(name: 'starRating')
  final List<int>? starRating;

  const SearchFiltersDto({
    this.starRating,
  });

  factory SearchFiltersDto.fromJson(Map<String, dynamic> json) =>
      _$SearchFiltersDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchFiltersDtoToJson(this);
}
