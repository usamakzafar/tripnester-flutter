import 'package:json_annotation/json_annotation.dart';
import 'search_property_dto.dart';
import '../../../domain/entities/search/search_response.dart';

part 'search_response_dto.g.dart';

@JsonSerializable()
class SearchResponseDto {
  @JsonKey(name: 'nextPropertyOffset')
  final int nextPropertyOffset;

  @JsonKey(name: 'properties')
  final List<SearchPropertyDto> properties;

  const SearchResponseDto({
    required this.nextPropertyOffset,
    required this.properties,
  });

  factory SearchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseDtoToJson(this);

  SearchResponse toDomain() {
    return SearchResponse(
      nextPropertyOffset: nextPropertyOffset,
      properties: properties.map((property) => property.toDomain()).toList(),
    );
  }
}
