// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponseDto _$SearchResponseDtoFromJson(Map<String, dynamic> json) =>
    SearchResponseDto(
      nextPropertyOffset: (json['nextPropertyOffset'] as num).toInt(),
      properties:
          (json['properties'] as List<dynamic>)
              .map((e) => SearchPropertyDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$SearchResponseDtoToJson(SearchResponseDto instance) =>
    <String, dynamic>{
      'nextPropertyOffset': instance.nextPropertyOffset,
      'properties': instance.properties,
    };
