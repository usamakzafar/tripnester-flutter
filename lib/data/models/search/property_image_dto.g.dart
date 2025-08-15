// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_image_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyImageDto _$PropertyImageDtoFromJson(Map<String, dynamic> json) =>
    PropertyImageDto(
      url: json['url'] as String,
      categorySlug: json['categorySlug'] as String?,
    );

Map<String, dynamic> _$PropertyImageDtoToJson(PropertyImageDto instance) =>
    <String, dynamic>{
      'url': instance.url,
      'categorySlug': instance.categorySlug,
    };
