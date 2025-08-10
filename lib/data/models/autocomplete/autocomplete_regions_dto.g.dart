// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_regions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AutocompleteRegionsDtoImpl _$$AutocompleteRegionsDtoImplFromJson(
  Map<String, dynamic> json,
) => _$AutocompleteRegionsDtoImpl(
  results:
      (json['results'] as List<dynamic>)
          .map((e) => RegionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$AutocompleteRegionsDtoImplToJson(
  _$AutocompleteRegionsDtoImpl instance,
) => <String, dynamic>{'results': instance.results};
