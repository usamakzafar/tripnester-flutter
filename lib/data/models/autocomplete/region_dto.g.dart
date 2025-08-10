// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegionDtoImpl _$$RegionDtoImplFromJson(Map<String, dynamic> json) =>
    _$RegionDtoImpl(
      name: json['name'] as String,
      regionId: json['regionId'] as String,
      regionType: json['regionType'] as String,
      priority: (json['priority'] as num).toInt(),
      location: LocationDto.fromJson(json['location'] as Map<String, dynamic>),
      countryCode: json['countryCode'] as String,
      countryName: json['countryName'] as String,
    );

Map<String, dynamic> _$$RegionDtoImplToJson(_$RegionDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'regionId': instance.regionId,
      'regionType': instance.regionType,
      'priority': instance.priority,
      'location': instance.location,
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
    };
