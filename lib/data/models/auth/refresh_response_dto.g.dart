// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefreshResponseDtoImpl _$$RefreshResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$RefreshResponseDtoImpl(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
);

Map<String, dynamic> _$$RefreshResponseDtoImplToJson(
  _$RefreshResponseDtoImpl instance,
) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
};
