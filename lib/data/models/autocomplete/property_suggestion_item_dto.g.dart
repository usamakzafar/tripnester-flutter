// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_suggestion_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertySuggestionItemDtoImpl _$$PropertySuggestionItemDtoImplFromJson(
  Map<String, dynamic> json,
) => _$PropertySuggestionItemDtoImpl(
  name: json['name'] as String,
  hid: (json['hid'] as num).toInt(),
  regionId: json['regionId'] as String,
  regionType: json['regionType'] as String,
  regionName: json['regionName'] as String,
  location: LocationDto.fromJson(json['location'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$PropertySuggestionItemDtoImplToJson(
  _$PropertySuggestionItemDtoImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'hid': instance.hid,
  'regionId': instance.regionId,
  'regionType': instance.regionType,
  'regionName': instance.regionName,
  'location': instance.location,
};
