import 'package:freezed_annotation/freezed_annotation.dart';
import 'region_dto.dart';
import '../../../domain/entities/autocomplete_regions.dart';

part 'autocomplete_regions_dto.freezed.dart';
part 'autocomplete_regions_dto.g.dart';

@freezed
class AutocompleteRegionsDto with _$AutocompleteRegionsDto {
  const factory AutocompleteRegionsDto({
    required List<RegionDto> results,
  }) = _AutocompleteRegionsDto;

  const AutocompleteRegionsDto._();

  factory AutocompleteRegionsDto.fromJson(Map<String, dynamic> json) =>
      _$AutocompleteRegionsDtoFromJson(json);

  AutocompleteRegions toDomain() {
    return AutocompleteRegions(
      results: results.map((region) => region.toDomain()).toList(),
    );
  }
}
