// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AutocompleteResponseDtoImpl _$$AutocompleteResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$AutocompleteResponseDtoImpl(
  regions: AutocompleteRegionsDto.fromJson(
    json['regions'] as Map<String, dynamic>,
  ),
  properties: AutocompletePropertyResultDto.fromJson(
    json['properties'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$AutocompleteResponseDtoImplToJson(
  _$AutocompleteResponseDtoImpl instance,
) => <String, dynamic>{
  'regions': instance.regions,
  'properties': instance.properties,
};
