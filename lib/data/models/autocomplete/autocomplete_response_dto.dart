import 'package:freezed_annotation/freezed_annotation.dart';
import 'autocomplete_regions_dto.dart';
import 'autocomplete_property_result_dto.dart';
import '../../../domain/entities/autocomplete_result.dart';

part 'autocomplete_response_dto.freezed.dart';
part 'autocomplete_response_dto.g.dart';

@freezed
class AutocompleteResponseDto with _$AutocompleteResponseDto {
  const factory AutocompleteResponseDto({
    required AutocompleteRegionsDto regions,
    required AutocompletePropertyResultDto properties,
  }) = _AutocompleteResponseDto;

  const AutocompleteResponseDto._();

  factory AutocompleteResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AutocompleteResponseDtoFromJson(json);

  AutocompleteResult toDomain() {
    return AutocompleteResult(
      regions: regions.toDomain(),
      properties: properties.toDomain(),
    );
  }
}
