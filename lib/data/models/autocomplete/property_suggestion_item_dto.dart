import 'package:freezed_annotation/freezed_annotation.dart';
import 'location_dto.dart';
import '../../../domain/entities/property_suggestion_item.dart';

part 'property_suggestion_item_dto.freezed.dart';
part 'property_suggestion_item_dto.g.dart';

@freezed
class PropertySuggestionItemDto with _$PropertySuggestionItemDto {
  const factory PropertySuggestionItemDto({
    required String name,
    required int hid,
    required String regionId,
    required String regionType,
    required String regionName,
    required LocationDto location,
  }) = _PropertySuggestionItemDto;

  const PropertySuggestionItemDto._();

  factory PropertySuggestionItemDto.fromJson(Map<String, dynamic> json) =>
      _$PropertySuggestionItemDtoFromJson(json);

  PropertySuggestionItem toDomain() {
    return PropertySuggestionItem(
      name: name,
      hid: hid,
      regionId: regionId,
      regionType: regionType,
      regionName: regionName,
      location: location.toDomain(),
    );
  }
}
