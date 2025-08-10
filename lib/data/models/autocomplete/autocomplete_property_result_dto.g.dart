// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_property_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AutocompletePropertyResultDtoImpl
_$$AutocompletePropertyResultDtoImplFromJson(Map<String, dynamic> json) =>
    _$AutocompletePropertyResultDtoImpl(
      results:
          (json['results'] as List<dynamic>)
              .map(
                (e) => PropertySuggestionItemDto.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
    );

Map<String, dynamic> _$$AutocompletePropertyResultDtoImplToJson(
  _$AutocompletePropertyResultDtoImpl instance,
) => <String, dynamic>{'results': instance.results};
