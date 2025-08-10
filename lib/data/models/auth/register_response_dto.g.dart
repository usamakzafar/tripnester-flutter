// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterResponseDtoImpl _$$RegisterResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$RegisterResponseDtoImpl(
  success: json['success'] as bool,
  user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
);

Map<String, dynamic> _$$RegisterResponseDtoImplToJson(
  _$RegisterResponseDtoImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'user': instance.user,
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
};
