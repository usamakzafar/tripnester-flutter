import 'package:freezed_annotation/freezed_annotation.dart';
import 'property_suggestion_item_dto.dart';
import '../../../domain/entities/autocomplete_property_result.dart';

part 'autocomplete_property_result_dto.freezed.dart';
part 'autocomplete_property_result_dto.g.dart';

@freezed
class AutocompletePropertyResultDto with _$AutocompletePropertyResultDto {
  const factory AutocompletePropertyResultDto({
    required List<PropertySuggestionItemDto> results,
  }) = _AutocompletePropertyResultDto;

  const AutocompletePropertyResultDto._();

  factory AutocompletePropertyResultDto.fromJson(Map<String, dynamic> json) =>
      _$AutocompletePropertyResultDtoFromJson(json);

  AutocompletePropertyResult toDomain() {
    return AutocompletePropertyResult(
      results: results.map((item) => item.toDomain()).toList(),
    );
  }
}
