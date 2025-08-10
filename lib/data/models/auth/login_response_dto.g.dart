// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseDtoImpl _$$LoginResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$LoginResponseDtoImpl(
  success: json['success'] as bool,
  user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
);

Map<String, dynamic> _$$LoginResponseDtoImplToJson(
  _$LoginResponseDtoImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'user': instance.user,
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
};
